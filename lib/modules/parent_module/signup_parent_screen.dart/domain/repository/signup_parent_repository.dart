import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/modules/parent_module/signup_parent_screen.dart/data/model/signup_parent_request_model.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failures.dart';

// abstract class for SignUp Parent Repository
abstract class SignUpParentRepository {
  /// This function called to sign up the parent to the app and create an account for him
  /// @Params 1. SignUpRequestModel [required]
  /// @return bool to indicate success
  Future<Either<Failure, ResponseWrapper<bool>>> signUpParent(
      {required SignUpParentRequestModel requestModel});
}
