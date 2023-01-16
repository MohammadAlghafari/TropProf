import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/modules/parent_module/signup_parent_screen.dart/data/model/signup_parent_request_model.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failure_error_handler.dart';
import '../../domain/repository/signup_parent_repository.dart';
import '../data_source/signup_parent_remote_data_source_imp.dart';

// implementation Sign Up Parent repository
class SignUpParentRepositoryImp implements SignUpParentRepository {
  final SignUpParentRemoteDataSourceImp _dataSourceImp;

  SignUpParentRepositoryImp(this._dataSourceImp);

  @override
  Future<Either<Failure, ResponseWrapper<bool>>> signUpParent(
      {required SignUpParentRequestModel requestModel}) {
    return RepoRemoteDataSourceHandler.repoRemoteDataSourceHandler(
        () => _dataSourceImp.signUpStudent(requestModel: requestModel));
  }
}
