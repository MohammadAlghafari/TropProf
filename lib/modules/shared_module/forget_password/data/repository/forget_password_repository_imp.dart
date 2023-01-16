import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/modules/shared_module/forget_password/data/model/reset_password_request_model.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failure_error_handler.dart';
import '../../domain/repository/forget_password_repository.dart';
import '../data_source/forget_password_remote_data_source_imp.dart';

// implementation Forget Password repository
class ForgetPasswordRepositoryImp implements ForgetPasswordRepository {
  final ForgetPasswordRemoteDataSourceImp _dataSourceImp;

  ForgetPasswordRepositoryImp(this._dataSourceImp);

  @override
  Future<Either<Failure, ResponseWrapper<String>>> forgetPassword(
      {required String email}) {
    return RepoRemoteDataSourceHandler.repoRemoteDataSourceHandler(
        () => _dataSourceImp.forgetPassword(email: email));
  }

  @override
  Future<Either<Failure, ResponseWrapper<String>>> resetPassword(
      {required ResetPasswordRequestModel requestModel}) {
    return RepoRemoteDataSourceHandler.repoRemoteDataSourceHandler(
        () => _dataSourceImp.resetPassword(requestModel: requestModel));
  }
}
