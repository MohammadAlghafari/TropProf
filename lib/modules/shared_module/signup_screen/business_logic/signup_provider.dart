import 'package:trop_prof_itfaq/constants/enums/user_type.dart';
import 'package:trop_prof_itfaq/core/base_provider/base_provider.dart';

class SignUpProvider extends BaseProvider {

  // selected user type for signup
  UserType? _userType;
  UserType? get userType => _userType;
 

  // change user type on the selected card
  changeUserType(UserType user) {
    _userType = user;
    update();
  }
}
