import 'package:dartz/dartz.dart';
import 'package:social_media_test/app+injection/di.dart';
import 'package:social_media_test/core/error/base_error.dart';
import 'package:social_media_test/core/param/base_param.dart';
import 'package:social_media_test/core/param/no_param.dart';
import 'package:social_media_test/core/result/result.dart';
import 'package:social_media_test/core/services/login_with_facebook.dart';
import 'package:social_media_test/core/services/sign_in_google.dart';
import 'package:social_media_test/core/usecases/base_use_case.dart';
import 'package:social_media_test/domain/repositories/auth_repository.dart';

import '../../core/services/device_info_service.dart';

import '../../data/requests/auth_request.dart';





//
//
class LoginParms
{
 LoginRequest loginRequest;
 LoginParms({required this.loginRequest});
}
class LoginUseCase extends UseCase<Future<Result<BaseError,bool>>,LoginParms> {
  final AuthRepository authRepository;
 // final deviceInfoService=locator<DeviceInfoService>();
  LoginUseCase({required this.authRepository});
  @override
  Future<Result<BaseError, bool>> call(LoginParms params) async {


    return authRepository.loginRepo(params.loginRequest);

  }


}

//
//
//
//

