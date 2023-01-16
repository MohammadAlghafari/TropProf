import 'package:trop_prof_itfaq/core/base_provider/base_provider.dart';

import '../../../../../core/utility/utility.dart';
import '../../data/model/signup_student_request_model.dart';
import '../../domain/usecase/signup_student_usecase.dart';

class SignUpStudentProvider extends BaseProvider {
  final SignUpStudentUseCase _signUpStudentUseCase;

  SignUpStudentProvider(this._signUpStudentUseCase);

  // Sign Up Student request function
  Future<bool> signupStudent(
      {required SignUpStudentRequestModel requestModel}) async {
    setLoading = true;
    update();
    var signUpResult = await _signUpStudentUseCase(
        SignUpStudentUseCaseParams(requestModel: requestModel));
    return signUpResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.props.first.toString());
      update();
      return false;
    }, (response) {
      setLoading = false;
      update();
      return true;
    });
  }
}
