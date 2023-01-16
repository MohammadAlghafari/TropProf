import '../../../../../core/api_handler/response_handler.dart';
import '../model/signup_student_request_model.dart';

/// abstract signUp Student class api call
abstract class SignUpStudentRemoteDataSource {
  /// This function called to sign up the Student to the app and create an account for him
  /// @Params 1. SignUpRequestModel [required]
  /// @return bool to indicate success
  Future<ResponseWrapper<bool>> signUpStudent({required SignUpStudentRequestModel requestModel});
}
