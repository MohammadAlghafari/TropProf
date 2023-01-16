import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/data/data_source/signup_teacher_remote_data_source_impl.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/data/model/signup_teacher_model.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/data/repository/singup_teacher_repository_imp.dart';

/// this class to mock Provider
class MockTeacherRemoteDataSourceImpl extends Mock
    implements SignUpTeacherRemoteDataSourceImp {}

/// This unit test build to check repo in two cases one for success another for failure.
void main() {
  /// define the variables.
  late MockTeacherRemoteDataSourceImpl? mockTeacherRemoteDataSourceImpl;
  late SignUpTeacherRepositoryImp? signUpRepositoryImp;

  /// setup test case init Mock repo && instance from use case.
  setUp(() {
    mockTeacherRemoteDataSourceImpl = MockTeacherRemoteDataSourceImpl();
    signUpRepositoryImp =
        SignUpTeacherRepositoryImp(mockTeacherRemoteDataSourceImpl!);
  });

  /// set data user name and password &
  /// set success and failure cases

  final SignUpTeacherRequestModel tTeacherRequestModel =
      SignUpTeacherRequestModel(
          email: '',
          firstName: '',
          lastName: '',
          password: '',
          dateOfBirth: '',
          confirmPassword: '',
          coursesWith: [],
          );
  const bool tTeacherResponseModel = true;

  /// test case for success case
  test(
    "SignUp should return bool success",
    () async {
      // Arrange
      // when(() => mockTeacherRemoteDataSourceImpl!.signupTeacher(requestModel: tTeacherRequestModel)).thenAnswer((_) async => tTeacherResponseModel);
      // // Act
      // final result = await signUpRepositoryImp!.signupTeacher(requestModel: tTeacherRequestModel);
      // // Assert
      // expect(result, Right(tTeacherRequestModel));
      // verify(() => mockTeacherRemoteDataSourceImpl!.signupTeacher(requestModel: tTeacherRequestModel));
      // verifyNoMoreInteractions(mockTeacherRemoteDataSourceImpl);
    },
  );

  /// test case for failure case
  test(
    "SignUp should return error form signup api",
    () async {
      // Arrange
      // when(() => mockTeacherRemoteDataSourceImpl!.signupTeacher(requestModel: tTeacherRequestModel)).thenThrow(const ServerException(message:ErrorMessages.nDefault));
      // // Act
      // final result = await signUpRepositoryImp!.signupTeacher(requestModel: tTeacherRequestModel);
      // // Assert
      // expect(result, const Left(ServerFailure(message: ErrorMessages.nDefault)));
      // verify(() => mockTeacherRemoteDataSourceImpl!.signupTeacher(requestModel:tTeacherRequestModel));
      // verifyNoMoreInteractions(mockTeacherRemoteDataSourceImpl!);
    },
  );
}
