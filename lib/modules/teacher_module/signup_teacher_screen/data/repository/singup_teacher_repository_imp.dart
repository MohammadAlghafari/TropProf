import 'package:dartz/dartz.dart';
import 'package:trop_prof_itfaq/core/api_handler/response_handler.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/level_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/subject_model.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/data/data_source/signup_teacher_remote_data_source_impl.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/data/model/signup_teacher_model.dart';
import '../../../../../core/error/failure_error_handler.dart';
import '../../domain/repository/signup_teacher_repository.dart';

// implementation SignUp repository
class SignUpTeacherRepositoryImp implements SignUpTeacherRepository {
  final SignUpTeacherRemoteDataSourceImp _signUpTeacherRemoteDataSource;

  SignUpTeacherRepositoryImp(this._signUpTeacherRemoteDataSource);

  @override
  Future<Either<Failure, ResponseWrapper<bool>>> signupTeacher(
      {required SignUpTeacherRequestModel requestModel}) {
    return RepoRemoteDataSourceHandler.repoRemoteDataSourceHandler(() =>
        _signUpTeacherRemoteDataSource.signupTeacher(
            requestModel: requestModel));
  }

  @override
  Future<Either<Failure, ResponseWrapper<List<SubjectModel>>>> getSubjects() {
    return RepoRemoteDataSourceHandler.repoRemoteDataSourceHandler(
        () => _signUpTeacherRemoteDataSource.getSubjects());
  }

  @override
  Future<Either<Failure, ResponseWrapper<List<LevelModel>>>> getLevels() {
    return RepoRemoteDataSourceHandler.repoRemoteDataSourceHandler(
        () => _signUpTeacherRemoteDataSource.getLevels());
  }
}
