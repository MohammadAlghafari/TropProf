import 'package:dartz/dartz.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/error/failures.dart';
import '../../data/model/login_response_model.dart';

// abstract class for Login Repository
abstract class LoginRepository {
  /// This function called to make the guest loggedIn inside the app
  /// @Params 1.Password as a String [ Required] , 2. username as a String [Required]
  /// @return Model from LoginModel
  Future<Either<Failure,ResponseWrapper<LoginResponseModel>>> login({required String username,required String password});
}