import 'package:dartz/dartz.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failures.dart';
import '../../data/model/student_profile_response_model.dart';

// abstract class for Student Home Repository
abstract class StudentHomeRepository {
  /// This function called to get the profile of the Student
  /// @return StudentProfileResponseModel
  Future<Either<Failure, ResponseWrapper<StudentProfileResponseModel>>>
      getStudentProfile();
}
