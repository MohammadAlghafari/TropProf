/// Storage to save token in local device
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trop_prof_itfaq/constants/enums/user_type.dart';
import 'package:trop_prof_itfaq/constants/prefs_keys/prefs_keys.dart';
import 'package:trop_prof_itfaq/core/singletons/singletons.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/data/model/teacher_profile_response_model.dart';

import '../../modules/student_module/student_home_screen/data/model/student_profile_response_model.dart';

/// This class to handle the operation store and get values from local storage in the device
class StorageManager {
  static final SharedPreferences _sharedPreferences =
      getIt<SharedPreferences>();

  /// This fun to store user token in local storage in the client device
  /// @params: token of the user as a string type
  /// @return void
  static void setUserToken(String token) {
    _sharedPreferences.setString(PrefsKeys.userToken, token);
  }

  /// This fun to get user token from local storage  in the client device
  /// @params no parameters
  /// @return String
  static String? getUserToken() {
    return _sharedPreferences.getString(
      PrefsKeys.userToken,
    )!;
  }

  /// This fun to store user refersh token in local storage in the client device
  /// @params: refresh token of the user as a string type
  /// @return void
  static void setUserRefreshToken(String token) {
    _sharedPreferences.setString(PrefsKeys.userRefreshToken, token);
  }

  /// This fun to get user refresh token from local storage  in the client device
  /// @params no parameters
  /// @return String
  static String? getUserRefreshToken() {
    return _sharedPreferences.getString(
      PrefsKeys.userRefreshToken,
    )!;
  }

  /// This fun to store user token expiery in local storage in the client device
  /// @params: refresh token of the user as a string type
  /// @return void
  static void setUserTokenExpiery(String token) {
    _sharedPreferences.setString(PrefsKeys.userTokenExpiery, token);
  }

  /// This fun to get user token expiery from local storage  in the client device
  /// @params no parameters
  /// @return String
  static String? getUserTokenExpiery() {
    return _sharedPreferences.getString(
      PrefsKeys.userTokenExpiery,
    )!;
  }

  /// This fun to store user refersh token expiery in local storage in the client device
  /// @params: refresh token of the user as a string type
  /// @return void
  static void setUserRefreshTokenExpiry(String token) {
    _sharedPreferences.setString(PrefsKeys.userRefreshTokenExpiery, token);
  }

  /// This fun to get user refresh token expiery from local storage  in the client device
  /// @params no parameters
  /// @return String
  static String? getUserRefreshTokenExpiery() {
    return _sharedPreferences.getString(
      PrefsKeys.userRefreshTokenExpiery,
    )!;
  }

  /// This fun to store user type in local storage in the client device
  /// @params : eum from UserType
  /// @return void
  static void setUserType(UserType userType) {
    _sharedPreferences.setInt(
        PrefsKeys.userType, UserType.values.indexOf(userType));
  }

  /// This fun to get user type from local storage  in the client device
  /// @params no parameters
  /// @return UserType eum
  static UserType getUserType() {
    return UserType.values[_sharedPreferences.getInt(
      PrefsKeys.userType,
    )!];
  }

  /// This fun to store teacher profile info
  /// @Params TeacherProfileResponseModel teacherInfo
  /// @return void
  static void setTeacherInfo(TeacherProfileResponseModel teacherInfo) {
    _sharedPreferences.setString(PrefsKeys.teacherInfo, teacherInfo.toJson());
  }

  /// This fun to get teacher profile info
  /// @Paramsmo parameters
  /// @return TeacherProfileResponseModel
  static TeacherProfileResponseModel getTeacherInfo() {
    return TeacherProfileResponseModel.fromJson(
        _sharedPreferences.getString(PrefsKeys.teacherInfo)!);
  }

  /// This fun to store Student profile info
  /// @Params StudentProfileResponseModel teacherInfo
  /// @return void
  static void setStudentInfo(StudentProfileResponseModel studentInfo) {
    _sharedPreferences.setString(PrefsKeys.studentInfo, studentInfo.toJson());
  }

  /// This fun to get Student profile info
  /// @Paramsmo parameters
  /// @return StudentProfileResponseModel
  static StudentProfileResponseModel getStudentInfo() {
    return StudentProfileResponseModel.fromJson(
        _sharedPreferences.getString(PrefsKeys.studentInfo)!);
  }

  /// This fun to store user logged In locally in the client device
  /// @Params no parameters
  /// @return void
  static void setUserLoggedIn() {
    _sharedPreferences.setBool(PrefsKeys.isLoggedIn, true);
  }

  /// This fun to get user loggedIn status from local Storage in the client device
  /// @Params no Parameter
  /// @return bool value [ true OR false ] otherwise if it didn't find the key return null
  static bool? isLoggedIn() {
    return _sharedPreferences.getBool(
      PrefsKeys.isLoggedIn,
    );
  }
}
