import 'package:trop_prof_itfaq/constants/enums/user_type.dart';
import 'package:trop_prof_itfaq/core/base_provider/base_provider.dart';
import 'package:trop_prof_itfaq/core/helpers/user_helper.dart';
import 'package:trop_prof_itfaq/core/local_storage/storage_manager.dart';
import 'package:trop_prof_itfaq/core/utility/utility.dart';

import '../../domain/usecase/login_usecase.dart';

class LoginProvider extends BaseProvider {
  final LoginUseCase _loginUseCase;

  LoginProvider(this._loginUseCase);
  // login function to handle login and change state depended on return
  Future<bool> login(
      {required String username, required String password}) async {
    setLoading = true;
    update();
    var loginResult = await _loginUseCase(
        LoginUseCaseParams(username: username, password: password));
    return loginResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.props.first.toString());
      update();
      return false;
    }, (response) {
      setLoading = false;

      /// set values in local storage in client device.
      /// save User access token & user type of the user & change the status of the user to loggedIn.

      UserType userType = UserHelper.getUserType(type: response.data!.type);
      StorageManager.setUserToken(response.data!.accessToken);
      StorageManager.setUserRefreshToken(response.data!.refreshToken);
      StorageManager.setUserTokenExpiery(
          response.data!.accessTokenExpirationDate);
      StorageManager.setUserRefreshTokenExpiry(
          response.data!.refreshTokenExpirationDate);
      StorageManager.setUserType(userType);
      StorageManager.setUserLoggedIn();
      return true;
    });
  }
}
