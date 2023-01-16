import 'package:trop_prof_itfaq/constants/api_keys/api_keys.dart';
import 'package:trop_prof_itfaq/core/api_handler/generic_exceptions.dart';
import 'package:trop_prof_itfaq/modules/student_module/signup_student_screen/data/data_source/signup_student_remote_data_source.dart';

import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/singletons/singletons_imports.dart';
import '../model/signup_student_request_model.dart';

class SignUpStudentRemoteDataSourceImp extends BaseApiProvider
    implements SignUpStudentRemoteDataSource {
  /// This function called to sign up the Student to the app and create an account for him
  /// @Params 1. SignUpRequestModel [required]
  /// @return bool to indicate success

  @override
  Future<ResponseWrapper<bool>> signUpStudent(
      {required SignUpStudentRequestModel requestModel}) async {
    Response? response;
    var res = ResponseWrapper<bool>();
    final params = requestModel.toMap();
    response = await client.post(
      Urls.signUpStudent,
      options: await getRequestWithoutToken(),
      data: params,
    );
    if (response.statusCode == 201) {
      res.data = response.data[ApiKeys.success];
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
