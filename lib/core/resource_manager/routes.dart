import 'package:flutter/material.dart';
import 'package:monasbatek/features/auth/presentation/login_screen.dart';
import 'package:monasbatek/features/home/home_screen.dart';

class Routes {
  static const String login = "/login";
  static const String home = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

    }
    return unDefinedRoute();

  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold());
  }
}
