import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/constant/api_url.dart';
import 'package:mobile/core/network/dio_client.dart';
import 'package:mobile/data/models/auth/signup_req_params.dart';
import 'package:mobile/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupReqParams params);
}

class AuthApiServiceImpl extends AuthApiService{
  @override
  Future<Either> signup(SignupReqParams params) async{
      try {
        var response = await sl<DioClient>().post(
          ApiUrl.signup,
          data: params.toMap(),
        );
        return Right(response.data);
      } on DioException catch (e) {
        return Left(e.response!.data['message']);
      }
  }




}

