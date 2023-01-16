// please add your import here if fail try to add here directly

import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/data/data_source/teacher_home_remote_data_source_imp.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/domain/usecase/get_teacher_profile_usecase.dart';

import '../../modules/shared_module/forget_password/domain/usecase/reset_password_usecase.dart';
import '../../modules/student_module/student_home_screen/business_logic/provider/student_home_provider.dart';
import '../../modules/student_module/student_home_screen/data/data_source/student_home_remote_data_source_imp.dart';
import '../../modules/student_module/student_home_screen/data/repository/student_home_repository_imp.dart';
import '../../modules/student_module/student_home_screen/domain/usecase/get_student_profile_usecase.dart';
import '../../modules/teacher_module/teacher_home_screen/data/repository/teacher_home_repository_imp.dart';
import 'singletons_imports.dart';

final getIt = GetIt.instance;

// init http request "should be init in main file before run app"
initSingletonInstances() async {
  // Register Core Components like dio client
  await registerCoreComponents();

  // Register Api Calls
  registerApiCalls();

  // Register Repositories
  registerRepositoriesImp();

  // Register UseCases
  registerUseCases();

  // Register Providers
  registerProviders();
}

registerApiCalls() {
  getIt.registerLazySingleton(() => LoginRemoteDataSourceImp());
  getIt.registerLazySingleton(() => ForgetPasswordRemoteDataSourceImp());
  getIt.registerLazySingleton(() => SignUpParentRemoteDataSourceImp());
  getIt.registerLazySingleton(() => SignUpStudentRemoteDataSourceImp());
  getIt.registerLazySingleton(() => SignUpTeacherRemoteDataSourceImp());
  getIt.registerLazySingleton(() => TeacherHomeRemoteDataSourceImp());
  getIt.registerLazySingleton(() => StudentHomeRemoteDataSourceImp());
}

registerRepositoriesImp() {
  getIt.registerLazySingleton(() => LoginRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => ForgetPasswordRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => SignUpParentRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => SignUpStudentRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => SignUpTeacherRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => TeacherHomeRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => StudentHomeRepositoryImp(getIt()));
}

registerUseCases() {
  getIt.registerLazySingleton(() => LoginUseCase(getIt<LoginRepositoryImp>()));
  getIt.registerLazySingleton(
      () => ForgetPasswordUseCase(getIt<ForgetPasswordRepositoryImp>()));
  getIt.registerLazySingleton(
      () => ResetPasswordUseCase(getIt<ForgetPasswordRepositoryImp>()));
  getIt.registerLazySingleton(
      () => SignUpParentUseCase(getIt<SignUpParentRepositoryImp>()));
  getIt.registerLazySingleton(
      () => SignUpStudentUseCase(getIt<SignUpStudentRepositoryImp>()));
  getIt.registerLazySingleton(
      () => SignUpTeacherUseCase(getIt<SignUpTeacherRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetSubjectsUseCase(getIt<SignUpTeacherRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetLevelsUseCase(getIt<SignUpTeacherRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetTeacherProfileUseCase(getIt<TeacherHomeRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetStudentProfileUseCase(getIt<StudentHomeRepositoryImp>()));
}

registerProviders() {
  getIt.registerLazySingleton(() => LoginProvider(getIt()));
  getIt.registerLazySingleton(() => ForgetPasswordProvider(getIt(), getIt()));
  getIt.registerLazySingleton(() => SignUpProvider());
  getIt.registerLazySingleton(() => SignUpParentProvider(getIt()));
  getIt.registerLazySingleton(() => SignUpStudentProvider(getIt()));
  getIt.registerLazySingleton(
      () => SignUpTeacherProvider(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton(() => TeacherHomeProvider(getIt()));
  getIt.registerLazySingleton(() => StudentHomeProvider(getIt()));
}

registerCoreComponents() async {
  getIt.registerSingleton<Dio>(getHttpClient());

  // create and register the shared prefrences object
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
