import '../../../../../core/api_handler/response_handler.dart';
import '../model/signup_parent_request_model.dart';

/// abstract signUp Parent class api call
abstract class SignUpParentRemoteDataSource {
  /// This function called to sign up the parent to the app and create an account for him
  /// @Params 1. SignUpRequestModel [required]
  /// @return bool to indicate success
  Future<ResponseWrapper<bool>> signUpStudent({required SignUpParentRequestModel requestModel});
}
