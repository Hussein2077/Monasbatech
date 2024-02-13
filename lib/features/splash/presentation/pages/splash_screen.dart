import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/routes.dart';
import 'package:monasbatek/core/utils/app_size.dart';

import '../../../../core/resource_manager/asset_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationScale;
  late Animation<double> _animationOpacity;

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // الأنيميشن للانبثاق
    _animationScale = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    Timer(const Duration(seconds: 1), () {
      _controller.forward().then((_) {
        Timer(const Duration(seconds: 2), () {
          Navigator.of(context).pushReplacementNamed(Routes.login);
        });
      });
    });

    // الأنيميشن للظهور
    _animationOpacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // تأخير بدء الأنيميشن
  }

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);

    return Scaffold(
      //  backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                child: Image.asset(AssetPath.splashImage, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Image.asset(AssetPath.splashBackgroundAnimation),
            ),
          ],
        ),
      ),
    );
  }
}
