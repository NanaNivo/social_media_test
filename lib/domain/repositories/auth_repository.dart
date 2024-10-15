import 'package:social_media_test/core/error/base_error.dart';
import 'package:social_media_test/core/repositories/repository.dart';
import 'package:social_media_test/core/result/result.dart';

import 'package:social_media_test/data/requests/auth_request.dart';


abstract class AuthRepository extends Repository
{
  Future<Result<BaseError, bool>> loginRepo(LoginRequest loginRequest);


}

