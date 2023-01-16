import 'package:dartz/dartz.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failures.dart';
import '../../data/model/teacher_profile_response_model.dart';

// abstract class for Teacher Home Repository
abstract class TeacherHomeRepository {
  /// This function called to get the profile of the teacher
  /// @return TeacherProfileResponseModel
  Future<Either<Failure, ResponseWrapper<TeacherProfileResponseModel>>>
      getTeacherProfile();
}
