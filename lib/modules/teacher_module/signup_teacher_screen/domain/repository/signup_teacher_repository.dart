import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/level_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/subject_model.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/data/model/signup_teacher_model.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failures.dart';

// abstract class for SignUp Teacher Repository
abstract class SignUpTeacherRepository {
  /// This function called to make the guest loggedIn inside the app
  /// @Params 1.SignUpTeacher Model as a String [ Required]
  /// @return Model from SignUp Teacher Response Model
  Future<Either<Failure, ResponseWrapper<bool>>> signupTeacher(
      {required SignUpTeacherRequestModel requestModel});

  /// This function called to get active subjects
  /// @return Model from subject Response Model
  Future<Either<Failure, ResponseWrapper<List<SubjectModel>>>> getSubjects();

  /// This function called to get active levels
  /// @return Model from level Response Model
  Future<Either<Failure, ResponseWrapper<List<LevelModel>>>> getLevels();
}
