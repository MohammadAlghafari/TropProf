import 'package:trop_prof_itfaq/constants/api_keys/api_keys.dart';
import 'package:trop_prof_itfaq/core/api_handler/generic_exceptions.dart';

import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/singletons/singletons_imports.dart';
import '../model/login_response_model.dart';
import 'login_remote_data_source.dart';

class LoginRemoteDataSourceImp extends BaseApiProvider
    implements LoginRemoteDataSource {
  /// This function called to make the guest loggedIn inside the app
  /// @Params 1.Password as a String [ Required] , 2. username as a String [Required]
  /// @return Model from LoginModel
  @override
  Future<ResponseWrapper<LoginResponseModel>> login(
      {required String username, required String password}) async {
    Response? response;
    var res = ResponseWrapper<LoginResponseModel>();
    final params = {
      'email': username,
      'password': password,
    };
    response = await client.post(
      Urls.login,
      options: await getRequestWithoutToken(),
      data: params,
    );
    if (response.statusCode == 201) {
      res.data = LoginResponseModel.fromMap(response.data[ApiKeys.data]);
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
