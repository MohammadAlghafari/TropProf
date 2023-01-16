import 'package:dartz/dartz.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failures.dart';
import '../../data/model/signup_student_request_model.dart';

// abstract class for SignUp Student Repository
abstract class SignUpStudentRepository {
  /// This function called to sign up the Student to the app and create an account for him
  /// @Params 1. SignUpRequestModel [required]
  /// @return bool to indicate success
  Future<Either<Failure, ResponseWrapper<bool>>> signUpStudent(
      {required SignUpStudentRequestModel requestModel});
}
