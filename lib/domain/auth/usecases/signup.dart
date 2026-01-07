import 'package:dartz/dartz.dart';
import 'package:mobile/core/usecase/usecase.dart';
import 'package:mobile/data/models/auth/signup_req_params.dart';
import 'package:mobile/domain/auth/repositories/auth.dart';
import 'package:mobile/service_locator.dart';

class SignUpUseCase extends UseCase<Either, SignupReqParams> {


  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signUp(params!);
  }
}
