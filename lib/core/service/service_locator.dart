import 'package:monasbatek/features/auth/data/auth_remote_data_source.dart';
import 'package:monasbatek/features/auth/data/repo_imp.dart';
import 'package:monasbatek/features/auth/domain/repo/base_repo.dart';
import 'package:monasbatek/features/auth/domain/use_case/change_password.dart';
import 'package:monasbatek/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:monasbatek/features/auth/domain/use_case/send_code.dart';
import 'package:monasbatek/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:monasbatek/features/auth/domain/use_case/verify_code.dart';
import 'package:monasbatek/features/auth/presentation/controller/change_password_bloc/change_password_bloc.dart';
import 'package:monasbatek/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:monasbatek/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:monasbatek/features/home/data/home_remote_data_source.dart';
import 'package:monasbatek/features/home/data/repo_imp.dart';
import 'package:monasbatek/features/home/domain/repo/base_repo.dart';
import 'package:monasbatek/features/home/domain/use_case/get_category_uc.dart';
import 'package:monasbatek/features/home/domain/use_case/get_sub_cat_uc.dart';
import 'package:monasbatek/features/home/presentation/bloc/category_bloc/get_category_bloc.dart';
import 'package:monasbatek/features/home/presentation/bloc/sub_category_bloc/get_category_bloc.dart';

final getIt = GetIt.instance;

class ServerLocator {
  Future<void> init() async {
    //bloc

    getIt.registerLazySingleton(() => LoginWithEmailAndPasswordBloc(
        loginWithEmailAndPasswordUseCase: getIt()));
    getIt.registerLazySingleton(() => SignUpWithEmailAndPasswordBloc(
        signUpWithEmailAndPasswordUseCase: getIt()));
    getIt.registerLazySingleton(() => ChangePasswordBloc(
          sendCodeUseCase: getIt(),
          verifyCodeUseCase: getIt(),
          changePasswordUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => CategoriesBloc(
          getCategoryUseCase: getIt(),
        )); getIt.registerLazySingleton(() => SubCategoriesBloc(
      getCategoryModelUseCase: getIt(),        ));

//use_case
    getIt.registerFactory(
        () => LoginWithEmailAndPasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(
        () => SignUpWithEmailAndPasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => SendCodeUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => VerifyCodeUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => ChangePasswordUseCase(baseRepository: getIt()));
    getIt
        .registerFactory(() => GetCategoryUseCase(homeBaseRepository: getIt()));
    getIt.registerFactory(
        () => GetCategoryModelUseCase(homeBaseRepository: getIt()));
    // repo and data source
    getIt.registerLazySingleton<BaseRemotelyDataSource>(
        () => AuthRemotelyDateSource());
    getIt.registerLazySingleton<BaseRepository>(
        () => RepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<HomeBaseRemotelyDataSource>(
        () => HomeRemotelyDateSource());
    getIt.registerLazySingleton<HomeBaseRepository>(
        () => HomeRepositoryImp(homeBaseRemotelyDataSource: getIt()));
  }
}
