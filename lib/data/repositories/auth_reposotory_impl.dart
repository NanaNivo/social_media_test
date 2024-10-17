import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_test/core/error/base_error.dart';
import 'package:social_media_test/core/result/result.dart';
import 'package:social_media_test/data/datasources/auth_data_source/auth_data_source.dart';



import 'package:social_media_test/data/requests/auth_request.dart';
import 'package:social_media_test/domain/repositories/auth_repository.dart';


import '../../core/services/session_manager.dart';


class AuthRepositoryImpl extends AuthRepository {
 // final AuthDataSource authDataSource;
  final SessionManager sessionManager;
 final FirebaseAuth auth;//= FirebaseAuth.instance;
  AuthRepositoryImpl({required this.auth, required this.sessionManager});


  @override
  Future<Result<BaseError, bool>> loginRepo(LoginRequest loginRequest) async {
    // final result = await authDataSource.loginSource(loginRequest);
    try {
      final result =  await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginRequest.email,
        password: loginRequest.password,
      );
      print("result in repo${result}");
      if (result.user != null) {
        final data = await result.user!.getIdToken();
        if (data != null) {
          sessionManager.persistToken(data);
          return Result(data: true);
        }

      }
      String message = 'no data';
     return Result(error: StringError(error:message));


    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        String   message = 'Invalid login credentials.';
     return  Result(error: StringError(error:message));
      } else
        {
      String  message = e.code;
      return  Result(error: StringError(error:message));
      }
    }

  }
  //

}


