import 'package:trop_prof_itfaq/constants/api_keys/api_keys.dart';
import 'package:trop_prof_itfaq/core/api_handler/generic_exceptions.dart';
import 'package:trop_prof_itfaq/modules/parent_module/signup_parent_screen.dart/data/data_source/signup_parent_remote_data_source.dart';
import 'package:trop_prof_itfaq/modules/parent_module/signup_parent_screen.dart/data/model/signup_parent_request_model.dart';

import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/singletons/singletons_imports.dart';

class SignUpParentRemoteDataSourceImp extends BaseApiProvider
    implements SignUpParentRemoteDataSource {
  /// This function called to sign up the parent to the app and create an account for him
  /// @Params 1. SignUpRequestModel [required]
  /// @return bool to indicate success

  @override
  Future<ResponseWrapper<bool>> signUpStudent(
      {required SignUpParentRequestModel requestModel}) async {
    Response? response;
    var res = ResponseWrapper<bool>();
    final params = requestModel.toMap();
    response = await client.post(
      Urls.signUpParent,
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
