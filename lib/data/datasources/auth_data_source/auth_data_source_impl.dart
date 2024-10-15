import 'package:dartz/dartz.dart';
import 'package:social_media_test/core/datasources/api_call_params.dart';
import 'package:social_media_test/core/datasources/function_instance.dart';
import 'package:social_media_test/core/enums/api/HttpMethod.dart';
import 'package:social_media_test/core/resources/apis.dart';

import 'package:social_media_test/data/responses/auth_response.dart';

import '../../../core/error/base_error.dart';

import '../../requests/auth_request.dart';

import 'auth_data_source.dart';

class AuthDataSourceImpl extends AuthDataSource {

  @override
  Future<Either<BaseError, String>> loginSource(LoginRequest loginRequest) {
    return request<String, LoginResponse>(ApiCallParams<LoginResponse>(
        responseStr: "LoginResponse",
        mapper: (json) => LoginResponse.fromJson(json),
        data: loginRequest.toJson(),
        method: HttpMethod.POST,
        url: ApiUrls.login));
  }



}
