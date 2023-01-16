import 'package:trop_prof_itfaq/core/base_provider/base_provider.dart';
import 'package:trop_prof_itfaq/modules/shared_module/forget_password/data/model/reset_password_request_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/forget_password/domain/usecase/forget_password_usecase.dart';

import '../../../../../core/utility/utility.dart';
import '../../domain/usecase/reset_password_usecase.dart';

class ForgetPasswordProvider extends BaseProvider {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  ForgetPasswordProvider(
      this._forgetPasswordUseCase, this._resetPasswordUseCase);

  String _email = '';
  String get email => _email;

  String _otpCode = '';

  // function to store the otp code temporiraly in provider
  set otpCode(String code) {
    _otpCode = code;
  }

  // forgetPassword function to handle forget Password and send email with OTP
  Future<bool> forgetPassword({
    required String email,
  }) async {
    _email = email;
    setLoading = true;
    update();
    var result = await _forgetPasswordUseCase(ForgetPasswordUseCaseParams(
      email: email,
    ));
    return result.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.props.first.toString());
      update();
      return false;
    }, (response) {
      setLoading = false;
      update();
      Utility.showToast(message: response.data!);
      return true;
    });
  }

  // resetPassword function to handle reset Password
  Future<bool> resetPassword({
    required String password,
  }) async {
    setLoading = true;
    update();
    var result = await _resetPasswordUseCase(ResetPasswordUseCaseParams(
        requestModel: ResetPasswordRequestModel(
            email: _email,
            otpCode: int.parse(_otpCode),
            newPassword: password,
            confirmNewPassword: password)));
    return result.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.props.first.toString());
      update();
      return false;
    }, (response) {
      setLoading = false;
      update();
      Utility.showToast(message: response.data!);
      return true;
    });
  }
}
