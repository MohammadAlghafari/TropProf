// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/core/generic_usecase/usecase.dart';
import 'package:trop_prof_itfaq/modules/shared_module/forget_password/data/model/reset_password_request_model.dart';

import '../../../../../core/api_handler/response_handler.dart';
import '../repository/forget_password_repository.dart';

/// reset password useCase to link with instance from repository
///
class ResetPasswordUseCase
    extends UseCase<ResponseWrapper<String>, ResetPasswordUseCaseParams> {
  final ForgetPasswordRepository _forgetPasswordRepository;

  ResetPasswordUseCase(this._forgetPasswordRepository);

  @override
  Future<Either<Failure, ResponseWrapper<String>>> call(
      ResetPasswordUseCaseParams params) {
    return _forgetPasswordRepository.resetPassword(
        requestModel: params.requestModel);
  }
}

class ResetPasswordUseCaseParams {
  final ResetPasswordRequestModel requestModel;
  ResetPasswordUseCaseParams({
    required this.requestModel,
  });
}
