import 'package:trop_prof_itfaq/constants/api_keys/api_keys.dart';
import 'package:trop_prof_itfaq/core/api_handler/generic_exceptions.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/level_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/subject_model.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/data/data_source/signup_teacher_remote_data_source.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/data/model/signup_teacher_model.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/singletons/singletons_imports.dart';

class SignUpTeacherRemoteDataSourceImp extends BaseApiProvider
    implements SignUpTeacherRemoteDataSource {
  /// This function called to make the guest loggedIn inside the app
  /// @Params 1. SignUp Teacher Request Model
  /// @return Model from SignUp Teacher Response Model
  @override
  Future<ResponseWrapper<bool>> signupTeacher(
      {required SignUpTeacherRequestModel requestModel}) async {
    Response? response;
    var res = ResponseWrapper<bool>();
    final params = requestModel.toMap();
    response = await client.post(
      Urls.signUpTeacher,
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

  /// This function called to get the active subjects
  /// @return Model from subject Response Model
  @override
  Future<ResponseWrapper<List<SubjectModel>>> getSubjects() async {
    Response? response;
    var res = ResponseWrapper<List<SubjectModel>>();
    response = await client.get(
      Urls.subjects,
      options: await getRequestWithoutToken(),
    );
    if (response.statusCode == 200) {
      res.data = (response.data[ApiKeys.data] as List)
          .map<SubjectModel>((json) => SubjectModel.fromMap(json))
          .toList();
      res.message = (response.data[ApiKeys.message] as List)
          .map<String>((e) => e)
          .toList();
      res.statusCode = response.data[ApiKeys.statusCode];
      res.success = response.data[ApiKeys.success];
      return res;
    }
    throw customExceptionHandlers(response);
  }

  /// This function called to get the active subjects
  /// @return Model from subject Response Model
  @override
  Future<ResponseWrapper<List<LevelModel>>> getLevels() async {
    Response? response;
    var res = ResponseWrapper<List<LevelModel>>();
    response = await client.get(
      Urls.levels,
      options: await getRequestWithoutToken(),
    );
    if (response.statusCode == 200) {
      res.data = (response.data[ApiKeys.data] as List)
          .map<LevelModel>((json) => LevelModel.fromMap(json))
          .toList();
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
