import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/routes.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/main_button.dart';
import 'package:monasbatek/core/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppSize.defaultSize!*8,),
    Image.asset(AssetPath.logo),
            SizedBox(height: AppSize.defaultSize!*2.6,),

            Text(
              StringManager.loginToYourAccount.tr(),
              maxLines: 2,
              style: TextStyle(
                  color: AppColors.black,

                  fontSize: AppSize.defaultSize! * 2,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: AppSize.defaultSize!*2.6,),

            CustomTextField(
              hintText: StringManager.email.tr(),

              controller: emailController,
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2,
            ),
            CustomTextField(
              hintText: StringManager.password.tr(),
              obscureText: isVisible,
              controller: passwordController,
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(
                  isVisible ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.forgetPassword);
                },
                child: Text(
                  StringManager.forgetYourPassword.tr(),
                  style: TextStyle(
                    color: AppColors.pink,
                    fontSize: AppSize.defaultSize! * 1.2,
                  ),
                ),
              ),
            ),
            MainButton(
              text: StringManager.login.tr(),
              onTap: () {

                Navigator.pushNamed(context, Routes.main);
              },
            ),
            SizedBox(
              height: AppSize.defaultSize! * 4,
            ),
            Text(
              StringManager.or.tr(),
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: AppSize.defaultSize! * 1.2,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetPath.google),
                SizedBox(
                  width: AppSize.defaultSize! * 2,
                ),
                Image.asset(AssetPath.apple),
              ],
            ),
            SizedBox(
              height: AppSize.screenHeight! * .1,
            ),
            Container(
              color: AppColors.containerColor,
              height: AppSize.defaultSize! * 4.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringManager.doNotHaveAccount.tr(),
                    style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: AppSize.defaultSize! * 1.4,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.signUp,
                      );
                    },
                    child: Text(
                      StringManager.signUp.tr(),
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: AppSize.defaultSize! * 1.5,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
