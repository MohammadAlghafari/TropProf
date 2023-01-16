import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trop_prof_itfaq/core/api_handler/error_message.dart';
import 'package:trop_prof_itfaq/core/api_handler/response_handler.dart';
import 'package:trop_prof_itfaq/core/error/exceptions.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/modules/shared_module/login_screen/data/data_source/login_remote_data_source_impl.dart';
import 'package:trop_prof_itfaq/modules/shared_module/login_screen/data/model/login_response_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/login_screen/data/repository/login_repository_imp.dart';

/// this class to mock Provider
class MockLoginRemoteDataSourceImpl extends Mock
    implements LoginRemoteDataSourceImp {}

/// This unit test build to check repo in two cases one for success another for failure.
void main() {
  /// define the variables.
  late MockLoginRemoteDataSourceImpl? mockLoginRemoteDataSourceImpl;
  late LoginRepositoryImp? loginRepositoryImp;

  /// setup test case init Mock repo && instance from use case.
  setUp(() {
    mockLoginRemoteDataSourceImpl = MockLoginRemoteDataSourceImpl();
    loginRepositoryImp = LoginRepositoryImp(mockLoginRemoteDataSourceImpl!);
  });

  /// set data user name and password &
  /// set success and failure cases
  const tUserName = 'userName';
  const tPassword = 'password';
  final LoginResponseModel tLoginModel = LoginResponseModel(
      accessToken: "XXx",
      refreshTokenExpirationDate: "2022-12-05T13:10:27.936Z",
      refreshToken: "YUYUYU",
      type: "Student",
      accessTokenExpirationDate: '2022-12-05T13:10:27.936Z');
  final tLoginResponse = ResponseWrapper<LoginResponseModel>();
  tLoginResponse.data = tLoginModel;

  /// test case for success case
  test(
    "login should return login response model",
    () async {
      // Arrange
      when(() => mockLoginRemoteDataSourceImpl!.login(
          username: tUserName,
          password: tPassword)).thenAnswer((_) async => tLoginResponse);
      // Act
      final result = await loginRepositoryImp!
          .login(username: tUserName, password: tPassword);
      // Assert
      expect(result, Right(tLoginResponse));
      verify(() => mockLoginRemoteDataSourceImpl!
          .login(username: tUserName, password: tPassword));
      verifyNoMoreInteractions(mockLoginRemoteDataSourceImpl);
    },
  );

  /// test case for failure case
  test(
    "login should return error form login api",
    () async {
      // Arrange
      when(() => mockLoginRemoteDataSourceImpl!
              .login(username: tUserName, password: tPassword))
          .thenThrow(const ServerException(message: ErrorMessages.nDefault));
      // Act
      final result = await loginRepositoryImp!
          .login(username: tUserName, password: tPassword);
      // Assert
      expect(
          result, const Left(ServerFailure(message: ErrorMessages.nDefault)));
      verify(() => mockLoginRemoteDataSourceImpl!
          .login(username: tUserName, password: tPassword));
      verifyNoMoreInteractions(mockLoginRemoteDataSourceImpl);
    },
  );
}
