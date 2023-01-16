import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/business_logic/signup_teacher_provider.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/domain/usecase/get_levels_usecase.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/domain/usecase/get_subjects_usecase.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/domain/usecase/signup_teacher_usecase.dart';

/// this class to mock SignUp usecase class
class MockSigUpTeacherUseCase extends Mock implements SignUpTeacherUseCase {}

/// this class to mock Get Subjects usecase class
class MockGetSubjectsUseCase extends Mock implements GetSubjectsUseCase {}

/// this class to mock Get Levels usecase class
class MockGetLevelsUseCase extends Mock implements GetLevelsUseCase {}

/// This unit test build to check usecase in two cases one for success another for failure.
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// define the variables.
  late MockSigUpTeacherUseCase? mockSigUpTeacherUseCase;
  late MockGetSubjectsUseCase? mockGetSubjectsUseCase;
  late MockGetLevelsUseCase? mockGetLevelsUseCase;
  late SignUpTeacherProvider? signUpTeacherProvider;

  /// setup test case init Mock usecase && instance from provider class .
  setUp(() {
    mockSigUpTeacherUseCase = MockSigUpTeacherUseCase();
    mockGetSubjectsUseCase = MockGetSubjectsUseCase();
    mockGetLevelsUseCase = MockGetLevelsUseCase();
    signUpTeacherProvider = SignUpTeacherProvider(mockSigUpTeacherUseCase!,
        mockGetSubjectsUseCase!, mockGetLevelsUseCase!);
  });

  group('test login functionality in provider layer', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(signUpTeacherProvider!.isLoading, false);
        expect(signUpTeacherProvider!.isError, false);
      },
    );
  });
}
