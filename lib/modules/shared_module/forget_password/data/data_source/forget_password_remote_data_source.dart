import 'package:trop_prof_itfaq/modules/shared_module/forget_password/data/model/reset_password_request_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

/// abstract forget Password class api call
abstract class ForgetPasswordRemoteDataSource {
  /// This function called to send Otp the email for resseting password
  /// @Params 1. String email [required]
  /// @return Success String to indicate success
  Future<ResponseWrapper<String>> forgetPassword({required String email});

  /// This function called to reset password
  /// @Params 1. Reset password request model [required]
  /// @return Success String to indicate success
  Future<ResponseWrapper<String>> resetPassword(
      {required ResetPasswordRequestModel requestModel});
}
