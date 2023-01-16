import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/data/model/teacher_profile_response_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

/// abstract Teacher home class api call
abstract class TeacherHomeRemoteDataSource {
  /// This function called to get the profile of the teacher 
  /// @return TeacherProfileResponseModel 
  Future<ResponseWrapper<TeacherProfileResponseModel>> getTeacherProfile();
}
