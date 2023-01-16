import 'package:dartz/dartz.dart';

import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failures.dart';
import '../../data/model/reset_password_request_model.dart';

/// abstract forget Password repository class
abstract class ForgetPasswordRepository {
  /// This function called to send Otp the email for resseting password
  /// @Params 1. String email [required]
  /// @return Success String to indicate success
  Future<Either<Failure, ResponseWrapper<String>>> forgetPassword(
      {required String email});
  
  /// This function called to reset password
  /// @Params 1. Reset password request model [required]
  /// @return Success String to indicate success
  Future<Either<Failure, ResponseWrapper<String>>> resetPassword(
      {required ResetPasswordRequestModel requestModel});
}
