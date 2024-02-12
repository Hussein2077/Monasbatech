import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/routes.dart';
import 'package:monasbatek/core/service/service_locator.dart';
import 'package:monasbatek/core/translations/translations.dart';
import 'package:monasbatek/features/auth/presentation/controller/change_password_bloc/change_password_bloc.dart';
import 'package:monasbatek/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:monasbatek/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:monasbatek/features/home/presentation/bloc/category_bloc/get_category_bloc.dart';
import 'package:monasbatek/features/home/presentation/bloc/category_bloc/get_category_event.dart';
import 'package:monasbatek/features/home/presentation/bloc/sub_category_bloc/get_category_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await ServerLocator().init();

  runApp(EasyLocalization(
      fallbackLocale: const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      assetLoader: CodegenLoader(),
      path: 'lib/core/translations/',
      saveLocale: true,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoginWithEmailAndPasswordBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SignUpWithEmailAndPasswordBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ChangePasswordBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<CategoriesBloc>(),
        ),BlocProvider(
          create: (context) =>
              getIt<SubCategoriesBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        builder: EasyLoading.init(),
        theme: ThemeData(
            listTileTheme: ListTileThemeData(
              horizontalTitleGap: 0, //here adjust based on your need
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.backGroundColor),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.main,
      ),
    );
  }
}
