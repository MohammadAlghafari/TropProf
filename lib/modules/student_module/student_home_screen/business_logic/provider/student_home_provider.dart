import 'package:trop_prof_itfaq/core/base_provider/base_provider.dart';
import 'package:trop_prof_itfaq/core/generic_usecase/usecase.dart';
import 'package:trop_prof_itfaq/core/local_storage/storage_manager.dart';

import '../../../../../core/utility/utility.dart';
import '../../data/model/student_profile_response_model.dart';
import '../../domain/usecase/get_student_profile_usecase.dart';

class StudentHomeProvider extends BaseProvider {
  StudentHomeProvider(this._getStudentProfileUseCase);

  final GetStudentProfileUseCase _getStudentProfileUseCase;

  // Student profile info
  StudentProfileResponseModel? _studentInfo;
  StudentProfileResponseModel? get studentInfo => _studentInfo;

  // get Student profile and store it in local storage
  Future<bool> getStudentProfile() async {
    setLoading = true;
    update();
    var signUpResult = await _getStudentProfileUseCase(NoParams());
    return signUpResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.props.first.toString());
      update();
      return false;
    }, (response) {
      setLoading = false;
      _studentInfo = response.data;
      StorageManager.setStudentInfo(response.data!);
      update();
      return true;
    });
  }
}
