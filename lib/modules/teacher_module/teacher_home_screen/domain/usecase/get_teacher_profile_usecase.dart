// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/core/generic_usecase/usecase.dart';

import '../../../../../core/api_handler/response_handler.dart';
import '../../data/model/teacher_profile_response_model.dart';
import '../repository/teacher_home_repository.dart';

/// get teacher profile useCase to link with instance from repository
///
class GetTeacherProfileUseCase
    extends UseCase<ResponseWrapper<TeacherProfileResponseModel>, NoParams> {
  final TeacherHomeRepository _teacherHomeRepository;

  GetTeacherProfileUseCase(this._teacherHomeRepository);

  @override
  Future<Either<Failure, ResponseWrapper<TeacherProfileResponseModel>>> call(
      NoParams params) {
    return _teacherHomeRepository.getTeacherProfile();
  }
}
