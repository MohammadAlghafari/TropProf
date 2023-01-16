import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trop_prof_itfaq/modules/shared_module/login_screen/business_logic/provider/login_provider.dart';
import 'package:trop_prof_itfaq/modules/shared_module/login_screen/domain/usecase/login_usecase.dart';


/// this class to mock login usecase class
class MockLoginUseCase extends Mock implements LoginUseCase {}

/// This unit test build to check usecase in two cases one for success another for failure.
void main() async{

  TestWidgetsFlutterBinding.ensureInitialized();
  /// define the variables.
  late MockLoginUseCase? mockLoginUseCase;
  late LoginProvider? loginProvider;

  /// setup test case init Mock usecase && instance from provider class .
  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    loginProvider = LoginProvider(mockLoginUseCase!);
  });


  group('test login functionality in provider layer', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(loginProvider!.isLoading, false);
        expect(loginProvider!.isError, false);
      },
    );
  });
}
