import 'package:trop_prof_itfaq/core/base_provider/base_provider.dart';
import 'package:trop_prof_itfaq/modules/parent_module/signup_parent_screen.dart/data/model/signup_parent_request_model.dart';

import '../../../../../core/utility/utility.dart';
import '../../domain/usecase/signup_parent_usecase.dart';

class SignUpParentProvider extends BaseProvider {
  final SignUpParentUseCase _signUpParentUseCase;

  SignUpParentProvider(this._signUpParentUseCase);

  // Sign Up parent request function
  Future<bool> signupParent(
      {required SignUpParentRequestModel requestModel}) async {
    setLoading = true;
    update();
    var signUpResult = await _signUpParentUseCase(
        SignUpParentUseCaseParams(requestModel: requestModel));
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
