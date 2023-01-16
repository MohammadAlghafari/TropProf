import 'package:trop_prof_itfaq/core/api_handler/response_handler.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/data/data_source/teacher_home_remote_data_source.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/data/model/teacher_profile_response_model.dart';

import '../../../../../constants/api_keys/api_keys.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/singletons/singletons_imports.dart';

// Imp class of the abstract remote data source class
class TeacherHomeRemoteDataSourceImp extends BaseApiProvider
    implements TeacherHomeRemoteDataSource {
  /// This function called to get the profile of the teacher
  /// @return TeacherProfileResponseModel
  @override
  Future<ResponseWrapper<TeacherProfileResponseModel>>
      getTeacherProfile() async {
    Response? response;
    var res = ResponseWrapper<TeacherProfileResponseModel>();
    response = await client.get(
      Urls.teacherProfile,
      options: await getRequestWithToken(),
    );
    if (response.statusCode == 200) {
      res.data =
          TeacherProfileResponseModel.fromMap(response.data[ApiKeys.data]);
      res.message = (response.data[ApiKeys.message] as List)
          .map<String>((e) => e)
          .toList();
      res.statusCode = response.data[ApiKeys.statusCode];
      res.success = response.data[ApiKeys.success];
      return res;
    }
    throw customExceptionHandlers(response);
  }
}
