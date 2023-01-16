import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/modules/shared_module/login_screen/data/model/login_response_model.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failure_error_handler.dart';
import '../../domain/repository/login_repository.dart';
import '../data_source/login_remote_data_source_impl.dart';

// implementation login repository
class LoginRepositoryImp implements LoginRepository {
  final LoginRemoteDataSourceImp _loginImp;

  LoginRepositoryImp(this._loginImp);

  @override
  Future<Either<Failure, ResponseWrapper<LoginResponseModel>>> login({required String username, required String password})  {
      return RepoRemoteDataSourceHandler.repoRemoteDataSourceHandler(() =>  _loginImp.login(username: username, password: password));
  }
}
