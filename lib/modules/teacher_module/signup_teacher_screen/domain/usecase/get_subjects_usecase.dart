// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/core/generic_usecase/usecase.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/subject_model.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../repository/signup_teacher_repository.dart';

/// Get Subjects useCase to link with instance from repository
///
class GetSubjectsUseCase
    extends UseCase<ResponseWrapper<List<SubjectModel>>, NoParams> {
  final SignUpTeacherRepository? _signUpTeacherRepository;

  GetSubjectsUseCase(this._signUpTeacherRepository);

  @override
  Future<Either<Failure, ResponseWrapper<List<SubjectModel>>>> call(
      NoParams params) {
    return _signUpTeacherRepository!.getSubjects();
  }
}
