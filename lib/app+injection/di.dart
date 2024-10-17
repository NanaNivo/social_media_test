import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:social_media_test/core/api/auth_interceptor.dart';
import 'package:social_media_test/core/blocs/application_bloc/app_bloc.dart';
import 'package:social_media_test/core/mediators/bloc_hub/concrete_hub.dart';
import 'package:social_media_test/core/mediators/bloc_hub/hub.dart';
import 'package:social_media_test/core/mediators/bloc_hub/members_key.dart';
import 'package:social_media_test/core/services/init_app_store.dart';
import 'package:social_media_test/core/services/session_manager.dart';
import 'package:social_media_test/core/services/theme_store.dart';
import 'package:social_media_test/core/usecases/app_theme_usecases.dart';
import 'package:social_media_test/core/usecases/check_first_initialize_usecase.dart';
import 'package:social_media_test/data/datasources/auth_data_source/auth_data_source.dart';
import 'package:social_media_test/data/datasources/auth_data_source/auth_data_source_impl.dart';

import 'package:social_media_test/data/repositories/auth_reposotory_impl.dart';
import 'package:social_media_test/data/repositories/post_reposotory_impl.dart';
import 'package:social_media_test/domain/repositories/auth_repository.dart';
import 'package:social_media_test/domain/repositories/post_repository.dart';
import 'package:social_media_test/domain/usecases/auth_usecases.dart';
import 'package:social_media_test/domain/usecases/post_usecases.dart';
import 'package:social_media_test/presentation/custom_widgets/infinite_list_view/entity/post_wrappers.dart';
import 'package:social_media_test/presentation/fa%C3%A7ades/app_facade.dart';
import 'package:social_media_test/presentation/flows/auth_flow/auth_bloc/auth_bloc.dart';
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_bloc.dart';
import 'package:social_media_test/presentation/flows/root_flow/bloc/root_cubit.dart';



final locator = GetIt.instance;

Future<void> setUpLocator() async {

  locator.registerLazySingleton<BlocHub>(() => ConcreteHub());
  locator.registerLazySingleton<ThemeStore>(() => ThemeStore());

  locator.registerLazySingleton<InitAppStore>(() => InitAppStore());
  locator.registerLazySingleton<SetAppThemeUseCase>(
      () => SetAppThemeUseCase(locator<ThemeStore>()));



  locator.registerLazySingleton<GetAppThemeUseCase>(
      () => GetAppThemeUseCase(locator<ThemeStore>()));

  locator.registerLazySingleton<CheckFirstInitUseCase>(
      () => CheckFirstInitUseCase(locator<InitAppStore>()));

  locator.registerLazySingleton<CheckLoginStatusUseCase>(
          () => CheckLoginStatusUseCase());

  // locator.registerLazySingleton<LocalDatabase>(() =>LocalDatabase() );
  // locator.registerLazySingleton<TaskItemsDao>(() =>TaskItemsDao(locator<LocalDatabase>()) );
  // locator.registerLazySingleton<TaskItemDataBaseMapper>(() =>TaskItemDataBaseMapper() );
  // locator.registerLazySingleton<TaskItemModelMapper>(() =>TaskItemModelMapper() );
  // locator.registerLazySingleton<TaskDataSource>(() =>TaskDataSourceImpl(taskItemsDao: locator<TaskItemsDao>(),dataBaseMapper:locator<TaskItemDataBaseMapper>(),modelMapper:locator<TaskItemModelMapper>()  ) );
  // locator.registerLazySingleton<TaskRepository>(() =>TaskRepositoryImpl(taskDataSource: locator<TaskDataSource>()) );




  // locator.registerLazySingleton<GetTaskUseCase>(() =>GetTaskUseCase(taskRepository: locator<TaskRepository>()) );
  // locator.registerLazySingleton<GetTask>(() =>GetTask(getTaskUseCase: locator<GetTaskUseCase>()) );


  locator.registerLazySingleton<SetFirstTimeUseCase>(
      () => SetFirstTimeUseCase(locator<InitAppStore>()));

  locator.registerLazySingleton<SessionManager>(
      () => DefaultSessionManager());
  locator.registerFactory<Dio>(() => Dio());

  locator.registerLazySingleton<AuthInterceptor>(
          () => AuthInterceptor(locator<SessionManager>(), locator<Dio>()));

  locator.registerLazySingleton<AppUiFacade>(() => AppUiFacade(
      setAppThemeUseCase: locator<SetAppThemeUseCase>(),
      getAppThemeUseCase: locator<GetAppThemeUseCase>(),
      checkFirstInitUseCase: locator<CheckFirstInitUseCase>(),
      setFirstTimeUseCase: locator<SetFirstTimeUseCase>(),
    checkLoginStatusUseCase: locator<CheckLoginStatusUseCase>()
      ));

  locator.registerLazySingleton<AppBloc>(() => AppBloc(appUiFacade: locator<AppUiFacade>()));

  locator.registerLazySingleton(() => RootCubit());


  locator.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
  locator.registerLazySingleton<FirebaseAuth>(() =>FirebaseAuth.instance);
  locator.registerLazySingleton<FirebaseDatabase>(() =>FirebaseDatabase.instance);


  locator.registerLazySingleton<PostRepository>(() =>PostRepositoryImpl(firebaseDatabase: locator<FirebaseDatabase>()));
  locator.registerLazySingleton<GetPostUseCase>(() =>GetPostUseCase(postRepository: locator<PostRepository>()));
  locator.registerLazySingleton<GetCommentUseCase>(() =>GetCommentUseCase(postRepository: locator<PostRepository>()));
  locator.registerLazySingleton<GetStoryUseCase>(() =>GetStoryUseCase(postRepository: locator<PostRepository>()));
  locator.registerLazySingleton<PostBloc>(() =>PostBloc(getPostUseCase: locator<GetPostUseCase>(),getCommentUseCase: locator<GetCommentUseCase>(),getStoryUseCase: locator<GetStoryUseCase>()));

  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(auth:locator<FirebaseAuth>(),sessionManager: locator<SessionManager>()));
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(authRepository: locator<AuthRepository>()));
  locator.registerLazySingleton<AuthBloc>(() => AuthBloc(locator<LoginUseCase>()));
}
