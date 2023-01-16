import 'package:trop_prof_itfaq/constants/api_keys/api_keys.dart';
import 'package:trop_prof_itfaq/core/api_handler/generic_exceptions.dart';
import 'package:trop_prof_itfaq/modules/shared_module/forget_password/data/model/reset_password_request_model.dart';

import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/singletons/singletons_imports.dart';
import 'forget_password_remote_data_source.dart';

class ForgetPasswordRemoteDataSourceImp extends BaseApiProvider
    implements ForgetPasswordRemoteDataSource {
  /// This function called to send Otp the email for resseting password
  /// @Params 1. String email [required]
  /// @return Success String to indicate success
  @override
  Future<ResponseWrapper<String>> forgetPassword(
      {required String email}) async {
    Response? response;
    var res = ResponseWrapper<String>();
    final params = {
      'email': email,
    };
    response = await client.post(
      Urls.forgetPassword,
      options: await getRequestWithoutToken(),
      data: params,
    );
    if (response.statusCode == 201) {
      res.data = response.data[ApiKeys.data];
      res.message = (response.data[ApiKeys.message] as List)
          .map<String>((e) => e)
          .toList();
      res.statusCode = response.data[ApiKeys.statusCode];
      res.success = response.data[ApiKeys.success];
      return res;
    }
    throw customExceptionHandlers(response);
  }

  /// This function called to reset password
  /// @Params 1. Reset password request model [required]
  /// @return Success String to indicate success
  @override
  Future<ResponseWrapper<String>> resetPassword({required ResetPasswordRequestModel requestModel}) async {
    Response? response;
    var res = ResponseWrapper<String>();
    final params = requestModel.toMap();
    response = await client.post(
      Urls.resetPassword,
      options: await getRequestWithoutToken(),
      data: params,
    );
    if (response.statusCode == 201) {
      res.data = response.data[ApiKeys.data];
      res.message = (response.data[ApiKeys.message] as List)
          .map<String>((e) => e)
          .toList();
      res.statusCode = response.data[ApiKeys.statusCode];
      res.success = response.data[ApiKeys.success];
      return res;
    }
    throw customExceptionHandlers(response);
  }
}
