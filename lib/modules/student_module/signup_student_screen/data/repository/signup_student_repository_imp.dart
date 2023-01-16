import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failure_error_handler.dart';
import '../../domain/repository/signup_student_repository.dart';
import '../data_source/signup_student_remote_data_source_imp.dart';
import '../model/signup_student_request_model.dart';

// implementation Sign Up Student repository
class SignUpStudentRepositoryImp implements SignUpStudentRepository {
  final SignUpStudentRemoteDataSourceImp _dataSourceImp;

  SignUpStudentRepositoryImp(this._dataSourceImp);

  @override
  Future<Either<Failure, ResponseWrapper<bool>>> signUpStudent(
      {required SignUpStudentRequestModel requestModel}) {
    return RepoRemoteDataSourceHandler.repoRemoteDataSourceHandler(
        () => _dataSourceImp.signUpStudent(requestModel: requestModel));
  }
}
