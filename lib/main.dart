import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social_media_test/app+injection/app.dart';
import 'package:social_media_test/app+injection/di.dart';
import 'package:social_media_test/core/error/http/forbidden_error.dart';
import 'package:social_media_test/core/services/memoization_store.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (error is ForbiddenError) {
      //  locator<AuthBloc>().logout();
    }
    super.onError(bloc, error, stackTrace);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();



  MemoizationStore().reset();
  await setUpLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const App());
}