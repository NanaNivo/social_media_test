import 'package:dartz/dartz.dart';
import 'package:social_media_test/core/datasources/remote_data_source.dart';
import 'package:social_media_test/core/error/base_error.dart';



import '../../requests/auth_request.dart';


abstract class AuthDataSource extends RemoteDataSource {

   Future<Either<BaseError,String>> loginSource(LoginRequest loginRequest);




}
