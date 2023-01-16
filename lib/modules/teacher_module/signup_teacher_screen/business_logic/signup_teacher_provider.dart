import 'package:trop_prof_itfaq/core/base_provider/base_provider.dart';
import 'package:trop_prof_itfaq/core/generic_usecase/usecase.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/level_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/subject_model.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/data/model/signup_teacher_model.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/domain/usecase/get_levels_usecase.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/domain/usecase/get_subjects_usecase.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/domain/usecase/signup_teacher_usecase.dart';

import '../../../../core/utility/utility.dart';

class SignUpTeacherProvider extends BaseProvider {
  final SignUpTeacherUseCase _signUpTeacherUseCase;
  final GetSubjectsUseCase _getSubjectsUseCase;
  final GetLevelsUseCase _getLevelsUseCase;

  SignUpTeacherProvider(this._signUpTeacherUseCase, this._getSubjectsUseCase,
      this._getLevelsUseCase);

  // list of the active subjects
  List<SubjectModel> _subjects = [];
  List<SubjectModel> get subjects => _subjects;

  // list of the active levels
  List<LevelModel> _levels = [];
  List<LevelModel> get levels => _levels;

  // User Data
  String _firstName = '';
  String get firstName => _firstName;
  String _lastName = '';
  String get lastName => _lastName;
  String _email = '';
  String get email => _email;
  String _birthDate = '';
  String get birthDate => _birthDate;
  String _password = '';
  String get password => _password;

  // selected subject index
  late int _subjectIndex = -1;
  int get subjectIndex => _subjectIndex;

  // selected level index
  late int _levelIndex = -1;
  int get levelIndex => _levelIndex;

  // loading indicator for sign up teacher 
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  // get all active subjects
  getSubjects() async {
    setLoading = true;
    update();
    var subjectsResult = await _getSubjectsUseCase(NoParams());
    return subjectsResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.props.first.toString());
      update();
    }, (response) {
      setLoading = false;
      _subjects = response.data!;
      update();
    });
  }

  // get all active levels
  getLevels() async {
    setLoading = true;
    update();
    var subjectsResult = await _getLevelsUseCase(NoParams());
    return subjectsResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.props.first.toString());
      update();
    }, (response) {
      setLoading = false;
      _levels = response.data!;
      update();
    });
  }

  // Sign Up Teacher request function
  Future<bool> signupTeacher() async {
    _signUpLoading = true;
    update();
    var signUpResult = await _signUpTeacherUseCase(
      SignUpTeacherUseCaseParams(
        requestModel: SignUpTeacherRequestModel(
          firstName: _firstName,
          lastName: _lastName,
          email: _email,
          dateOfBirth: _birthDate,
          password: _password,
          confirmPassword: _password,
          coursesWith: [
            TeacherCourse(
                subjectId: _subjects[subjectIndex].id!,
                levelsIds: [_levels[_levelIndex].id!])
          ],
        ),
      ),
    );
    return signUpResult.fold((error) {
      setError = true;
      _signUpLoading = false;
      Utility.showToast(message: error.props.first.toString());
      update();
      return false;
    }, (response) {
      _signUpLoading = false;
      update();
      return true;
    });
  }

  // set the user data in provider
  setUserData(
      String fName, String lName, String email, String bDate, String pass) {
    _firstName = fName;
    _lastName = lName;
    _email = email;
    _birthDate = bDate;
    _password = pass;
  }

  // chaneg level selection
  selectLevel(int index) {
    _levelIndex = index;
    update();
  }

  // change teacher subject name
  changeSubject(int subjectIndex) {
    _subjectIndex = subjectIndex;
    update();
  }
}
