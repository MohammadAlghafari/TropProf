import 'package:trop_prof_itfaq/constants/enums/user_type.dart';

class UserHelper {
  static UserType getUserType({required String type}) {
    switch (type) {
      case 'Student':
        return UserType.studentOver18;
      case 'Parent':
        return UserType.parent;
      case 'Teacher':
        return UserType.teacher;
      default:
        return UserType.studentOver18;
    }
  }
}
