import 'package:flutter/material.dart';
import 'package:monasbatek/features/auth/presentation/login_screen.dart';
import 'package:monasbatek/features/home/home_screen.dart';

import '../../features/splash/presentation/pages/splash_screen.dart';

class Routes {
  static const String splash = "/";
  static const String home = "/home";
  static const String login = "/login";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
    return unDefinedRoute();
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
