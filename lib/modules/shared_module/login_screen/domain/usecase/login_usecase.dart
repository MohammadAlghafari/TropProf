// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/core/generic_usecase/usecase.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../data/model/login_response_model.dart';
import '../repository/login_repository.dart';

/// login useCase to link with instance from repository
///
class LoginUseCase extends UseCase<ResponseWrapper<LoginResponseModel>, LoginUseCaseParams> {
  final LoginRepository? _loginRepository;

  LoginUseCase(this._loginRepository);

  @override
  Future<Either<Failure, ResponseWrapper<LoginResponseModel>>> call(LoginUseCaseParams params) {
    return _loginRepository!.login(username: params.username, password: params.password);
  }
}

class LoginUseCaseParams {
  final String username;
  final String password;
  LoginUseCaseParams({required this.username,required this.password});

}

