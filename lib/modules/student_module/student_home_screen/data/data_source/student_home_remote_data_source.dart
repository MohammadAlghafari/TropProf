

import '../../../../../core/api_handler/response_handler.dart';
import '../model/student_profile_response_model.dart';

/// abstract Student home class api call
abstract class StudentHomeRemoteDataSource {
  /// This function called to get the profile of the student 
  /// @return StudentProfileResponseModel 
  Future<ResponseWrapper<StudentProfileResponseModel>> getStudentProfile();
}
