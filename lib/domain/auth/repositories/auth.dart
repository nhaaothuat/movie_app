import 'package:dartz/dartz.dart';
import 'package:mobile/data/models/auth/signin_req_params.dart';
import 'package:mobile/data/models/auth/signup_req_params.dart';

abstract class AuthRepository {

  Future<Either> signUp(SignupReqParams params);
  Future<Either> signIn(SigninReqParams params);
}