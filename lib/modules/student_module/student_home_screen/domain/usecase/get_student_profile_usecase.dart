// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/core/generic_usecase/usecase.dart';

import '../../../../../core/api_handler/response_handler.dart';
import '../../data/model/student_profile_response_model.dart';
import '../repository/student_home_repository.dart';

/// get Student profile useCase to link with instance from repository
///
class GetStudentProfileUseCase
    extends UseCase<ResponseWrapper<StudentProfileResponseModel>, NoParams> {
  final StudentHomeRepository _studentHomeRepository;

  GetStudentProfileUseCase(this._studentHomeRepository);

  @override
  Future<Either<Failure, ResponseWrapper<StudentProfileResponseModel>>> call(
      NoParams params) {
    return _studentHomeRepository.getStudentProfile();
  }
}
