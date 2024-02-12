import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monasbatek/core/utils/app_size.dart';

import '../../../../core/resource_manager/asset_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween(begin: Offset(0, 0), end: Offset(-0.2, -0.2))
        .animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });

    _animationController!.forward();

    Timer(Duration(seconds: 4), () {
      // الانتقال إلى الشاشة التالية
      //  Navigator.pushNamed(context, Routes.onBoardingScreen);
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
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
