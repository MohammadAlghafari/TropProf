import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failure_error_handler.dart';
import '../../domain/repository/student_home_repository.dart';
import '../data_source/student_home_remote_data_source_imp.dart';
import '../model/student_profile_response_model.dart';

// implementation Student Home repository
class StudentHomeRepositoryImp implements StudentHomeRepository {
  final StudentHomeRemoteDataSourceImp _dataSourceImp;

  StudentHomeRepositoryImp(this._dataSourceImp);

  @override
  Future<Either<Failure, ResponseWrapper<StudentProfileResponseModel>>>
      getStudentProfile() {
    return RepoRemoteDataSourceHandler.repoRemoteDataSourceHandler(
        () => _dataSourceImp.getStudentProfile());
  }
}
