
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:unimastery_mobile/data/cache.dart';

import 'data-model/authenticate/authenticate.dart';
import 'data-model/completeRegistration/complete_registration.dart';
import 'data-model/user/user-entity.dart';
import 'data-model/verify_otp.dart';

part 'rest_api.g.dart';

// Every time something change run the command flutter pub run build_runner build

@RestApi(baseUrl: "http://172.20.10.2:3001/")
abstract class RestClient {

  static const String AUTHORIZATION = "Authorization";

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient getApi({bool isAuth = true}) {

    final dio = Dio(BaseOptions(contentType: "application/json"));
    dio.interceptors.add(LogInterceptor(responseBody: true));

    if (isAuth){
      dio.options.headers[AUTHORIZATION] = 'Bearer ${Cache.token}';
    }

    return new RestClient(dio);
  }

  @GET("api/user/otp/sendOtp/{phoneNumber}")
  Future<void> sendOtp(@Path("phoneNumber") String phoneNumber);

  @POST("api/user/otp/verifyOtp")
  Future<AuthenticateVM> verifyingOtp(@Body() VerifyingOtp verifyingOtp);

  @POST("api/user/user/completeRegistrationAfterOTP")
  Future<UserEntity> completeRegistrationAfterOTP(@Body() CompleteRegistration completeRegistration);


}