import 'package:trop_prof_itfaq/core/api_handler/response_handler.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/level_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/subject_model.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/data/model/signup_teacher_model.dart';

/// abstract login class api call
abstract class SignUpTeacherRemoteDataSource {
  /// This function called to make the user have a account as Teacher Role.
  /// @Params 1. SignUp Teacher Request Model
  /// @return Model from SignUp Teacher Response Model
  Future<ResponseWrapper<bool>> signupTeacher(
      {required SignUpTeacherRequestModel requestModel});

  /// This function called to get the subjects models.
  /// @return list Model from subject Response Model
  Future<ResponseWrapper<List<SubjectModel>>> getSubjects();

  /// This function called to get the Levels models.
  /// @return list Model from Level Response Model
  Future<ResponseWrapper<List<LevelModel>>> getLevels();
}
