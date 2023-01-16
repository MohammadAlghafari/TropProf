// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/core/generic_usecase/usecase.dart';

import '../../../../../core/api_handler/response_handler.dart';
import '../repository/forget_password_repository.dart';

/// forget password useCase to link with instance from repository
///
class ForgetPasswordUseCase
    extends UseCase<ResponseWrapper<String>, ForgetPasswordUseCaseParams> {
  final ForgetPasswordRepository _forgetPasswordRepository;

  ForgetPasswordUseCase(this._forgetPasswordRepository);

  @override
  Future<Either<Failure, ResponseWrapper<String>>> call(
      ForgetPasswordUseCaseParams params) {
    return _forgetPasswordRepository.forgetPassword(email: params.email);
  }
}

class ForgetPasswordUseCaseParams {
  final String email;
  ForgetPasswordUseCaseParams({
    required this.email,
  });
}
