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
      final result = await auth
          .createUserWithEmailAndPassword( // instantiated earlier on: final _firebaseAuth = FirebaseAuth.instance;
        email: loginRequest.email,
        password: loginRequest.password,
      );
      if (result.user != null) {
        final data = await result.user!.getIdToken();
        if (data != null) {
          sessionManager.persistToken(data);
        }
        return Result(data: true);
      }
      String message = 'no data';
     return Result(error: StringError(error:message));


    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
       String message = 'The password provided is too weak.';
     return  Result(error: StringError(error:message));
      } else if (e.code == 'email-already-in-use') {
      String  message = 'An account already exists with that email.';
      return  Result(error: StringError(error:message));
      }
    }
    String message = 'no data';
    return Result(error: StringError(error:message));
  }
  //

}


