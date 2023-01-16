import 'package:trop_prof_itfaq/core/base_provider/base_provider.dart';
import 'package:trop_prof_itfaq/core/generic_usecase/usecase.dart';
import 'package:trop_prof_itfaq/core/local_storage/storage_manager.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/data/model/teacher_profile_response_model.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/domain/usecase/get_teacher_profile_usecase.dart';

import '../../../../../core/utility/utility.dart';

class TeacherHomeProvider extends BaseProvider {
  TeacherHomeProvider(this._getTeacherProfileUseCase);

  final GetTeacherProfileUseCase _getTeacherProfileUseCase;

  // teacher profile info
  TeacherProfileResponseModel? _teacherInfo;
  TeacherProfileResponseModel? get teacherInfo => _teacherInfo;

  // get teacher profile and store it in local storage
  Future<bool> getTeacherProfile() async {
    setLoading = true;
    update();
    var signUpResult = await _getTeacherProfileUseCase(NoParams());
    return signUpResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.props.first.toString());
      update();
      return false;
    }, (response) {
      setLoading = false;
      _teacherInfo = response.data;
      StorageManager.setTeacherInfo(response.data!);
      update();
      return true;
    });
  }
}
