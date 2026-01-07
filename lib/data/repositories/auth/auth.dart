import 'package:dartz/dartz.dart';
import 'package:mobile/data/models/auth/signin_req_params.dart';
import 'package:mobile/data/models/auth/signup_req_params.dart';
import 'package:mobile/data/source/auth/auth_api_service.dart';
import 'package:mobile/domain/auth/repositories/auth.dart';
import 'package:mobile/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {


  @override
  Future<Either> signUp(SignupReqParams params) async {
    // return await authApiService.signup(params);
  return await sl<AuthApiService>().signup(params);
  }

  @override
  Future<Either<dynamic, dynamic>> signIn(SigninReqParams params) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  
}
