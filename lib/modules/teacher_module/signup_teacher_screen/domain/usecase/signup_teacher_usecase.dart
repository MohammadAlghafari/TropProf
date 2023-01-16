// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/core/generic_usecase/usecase.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/data/model/signup_teacher_model.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../repository/signup_teacher_repository.dart';

/// SignUp Teacher useCase to link with instance from repository
///
class SignUpTeacherUseCase extends UseCase<ResponseWrapper< bool>, SignUpTeacherUseCaseParams> {
  final SignUpTeacherRepository? _signUpTeacherRepository;

  SignUpTeacherUseCase(this._signUpTeacherRepository);

  @override
  Future<Either<Failure, ResponseWrapper< bool>>> call(SignUpTeacherUseCaseParams params) {
    return _signUpTeacherRepository!.signupTeacher(requestModel: params.requestModel);
  }
}

class SignUpTeacherUseCaseParams {
  final SignUpTeacherRequestModel requestModel;
  SignUpTeacherUseCaseParams({required this.requestModel});

}

