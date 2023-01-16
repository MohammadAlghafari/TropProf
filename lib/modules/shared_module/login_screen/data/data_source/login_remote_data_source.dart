import 'package:trop_prof_itfaq/core/api_handler/response_handler.dart';

import '../model/login_response_model.dart';

/// abstract login class api call
abstract class LoginRemoteDataSource {
  /// This function called to make the guest loggedIn inside the app
  /// @Params 1.Password as a String , 2. username as a String
  /// @return Model from LoginModel
  Future<ResponseWrapper<LoginResponseModel>> login(
      {required String username, required String password});
}
