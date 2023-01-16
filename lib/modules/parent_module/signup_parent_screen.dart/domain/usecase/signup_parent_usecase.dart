// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/core/generic_usecase/usecase.dart';
import 'package:trop_prof_itfaq/modules/parent_module/signup_parent_screen.dart/data/model/signup_parent_request_model.dart';

import '../../../../../core/api_handler/response_handler.dart';
import '../repository/signup_parent_repository.dart';

/// sign up parent useCase to link with instance from repository
///
class SignUpParentUseCase extends UseCase<ResponseWrapper<bool>, SignUpParentUseCaseParams> {
  final SignUpParentRepository _signupRepository;

  SignUpParentUseCase(this._signupRepository);

  @override
  Future<Either<Failure, ResponseWrapper<bool>>> call(SignUpParentUseCaseParams params) {
    return _signupRepository.signUpParent(requestModel: params.requestModel);
  }
}

class SignUpParentUseCaseParams {
  final SignUpParentRequestModel requestModel;
  SignUpParentUseCaseParams({
    required this.requestModel,
  });
}
