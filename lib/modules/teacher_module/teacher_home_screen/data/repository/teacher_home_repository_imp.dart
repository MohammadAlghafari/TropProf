import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failure_error_handler.dart';
import '../../domain/repository/teacher_home_repository.dart';
import '../data_source/teacher_home_remote_data_source_imp.dart';
import '../model/teacher_profile_response_model.dart';

// implementation Teacher Home repository
class TeacherHomeRepositoryImp implements TeacherHomeRepository {
  final TeacherHomeRemoteDataSourceImp _dataSourceImp;

  TeacherHomeRepositoryImp(this._dataSourceImp);

  @override
  Future<Either<Failure, ResponseWrapper<TeacherProfileResponseModel>>>
      getTeacherProfile() {
    return RepoRemoteDataSourceHandler.repoRemoteDataSourceHandler(
        () => _dataSourceImp.getTeacherProfile());
  }
}
