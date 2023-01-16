// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/core/generic_usecase/usecase.dart';

import '../../../../../core/api_handler/response_handler.dart';
import '../../data/model/signup_student_request_model.dart';
import '../repository/signup_student_repository.dart';

/// sign up Student useCase to link with instance from repository
///
class SignUpStudentUseCase extends UseCase<ResponseWrapper<bool>, SignUpStudentUseCaseParams> {
  final SignUpStudentRepository _signupRepository;

  SignUpStudentUseCase(this._signupRepository);

  @override
  Future<Either<Failure, ResponseWrapper<bool>>> call(SignUpStudentUseCaseParams params) {
    return _signupRepository.signUpStudent(requestModel: params.requestModel);
  }
}

class SignUpStudentUseCaseParams {
  final SignUpStudentRequestModel requestModel;
  SignUpStudentUseCaseParams({
    required this.requestModel,
  });
}
