import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trop_prof_itfaq/core/api_handler/error_message.dart';
import 'package:trop_prof_itfaq/core/api_handler/response_handler.dart';
import 'package:trop_prof_itfaq/core/error/failures.dart';
import 'package:trop_prof_itfaq/modules/shared_module/login_screen/data/model/login_response_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/login_screen/data/repository/login_repository_imp.dart';
import 'package:trop_prof_itfaq/modules/shared_module/login_screen/domain/usecase/login_usecase.dart';

/// this class to mock repository
class MockLoginRepositoryImp extends Mock implements LoginRepositoryImp {}

/// This unit test build to check usecase in two cases one for success another for failure.
void main() {
  /// define the variables.
  late MockLoginRepositoryImp? mockLoginRepositoryImp;
  late LoginUseCase? loginUseCase;

  /// setup test case init Mock repo && instance from use case.
  setUp(() {
    mockLoginRepositoryImp = MockLoginRepositoryImp();
    loginUseCase = LoginUseCase(mockLoginRepositoryImp);
  });

  /// set data user name and password &
  /// set success and failure cases
  const tUserName = 'userName';
  const tPassword = 'password';
  final LoginResponseModel tLoginResponseModel = LoginResponseModel(
      accessToken: "XXx",
      refreshTokenExpirationDate: "2022-12-05T13:10:27.936Z",
      refreshToken: "YUYUYU",
      type: "Student",
      accessTokenExpirationDate: '2022-12-05T13:10:27.936Z');
  final tLoginResponseSuccess = ResponseWrapper<LoginResponseModel>();
  tLoginResponseSuccess.data = tLoginResponseModel;

  /// test case for success case
  test(
    "should return login response model when calling login",
    () async {
      // Arrange
      when(() => mockLoginRepositoryImp!
              .login(username: tUserName, password: tPassword))
          .thenAnswer((invocation) async => Right(tLoginResponseSuccess));
      // Act
      final result = await loginUseCase!(
          LoginUseCaseParams(username: tUserName, password: tPassword));
      // Assert
      expect(result, Right(tLoginResponseSuccess));
      verify(() => mockLoginRepositoryImp!
          .login(username: tUserName, password: tPassword));
      verifyNoMoreInteractions(mockLoginRepositoryImp);
    },
  );

  /// test case for failure case
  test(
    "should return error calling login",
    () async {
      // Arrange
      when(() => mockLoginRepositoryImp!
              .login(username: tUserName, password: tPassword))
          .thenAnswer((inv) async =>
              const Left(ServerFailure(message: ErrorMessages.nDefault)));
      // Act
      final result = await loginUseCase!(
          LoginUseCaseParams(username: tUserName, password: tPassword));
      // Assert
      expect(
          result, const Left(ServerFailure(message: ErrorMessages.nDefault)));
      verify(() => mockLoginRepositoryImp!
          .login(username: tUserName, password: tPassword));
      verifyNoMoreInteractions(mockLoginRepositoryImp);
    },
  );
}
