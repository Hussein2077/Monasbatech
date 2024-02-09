import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/routes.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/main_button.dart';
import 'package:monasbatek/core/widgets/custom_text_field.dart';
import 'package:monasbatek/core/widgets/snack_bar.dart';
import 'package:monasbatek/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:monasbatek/features/auth/presentation/controller/login_bloc/login_with_email_and_password_events.dart';
import 'package:monasbatek/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';

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
    return BlocListener<LoginWithEmailAndPasswordBloc, LoginWithEmailAndPasswordState>(
      listener: (context, state) {
        if (state is LoginWithEmailAndPasswordSuccessMessageState) {
          EasyLoading.dismiss();

          Navigator.pushNamedAndRemoveUntil(
              context, Routes.home, (route) => false);
        } else if (state is LoginWithEmailAndPasswordErrorMessageState) {
          EasyLoading.dismiss();

          errorSnackBar(context, state.errorMessage);
        } else if (state is LoginWithEmailAndPasswordLoadingState) {
          EasyLoading.show(status: 'loading...');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: AppSize.defaultSize! * 8,
              ),
              Image.asset(AssetPath.logo),
              SizedBox(
                height: AppSize.defaultSize! * 2.6,
              ),
              Text(
                StringManager.loginToYourAccount.tr(),
                maxLines: 2,
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: AppSize.defaultSize! * 2,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 2.6,
              ),
              CustomTextField(
                prefixIcon: SvgPicture.asset(
                  AssetPath.emailIcon,
                ),
                hintText: StringManager.email.tr(),
                controller: emailController,
              ),
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              CustomTextField(
                prefixIcon: SvgPicture.asset(
                  AssetPath.lock,
                ),
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
                  if (validation()) {
                    BlocProvider.of<LoginWithEmailAndPasswordBloc>(context)
                        .add(LoginWithEmailAndPasswordEvent(
                      email: emailController.text,
                      password: passwordController.text,
                    ));
                  } else {}
                },
              ),
              SizedBox(
                height: AppSize.defaultSize! * 4,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: AppSize.defaultSize! * 2,
                    right: AppSize.defaultSize! * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                      color: AppColors.greyColor,
                      width: AppSize.defaultSize! * 17,
                    ),
                    Text(
                      StringManager.or.tr(),
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: AppSize.defaultSize! * 1.2,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.greyColor,
                      width: AppSize.defaultSize! * 17,
                    ),
                  ],
                ),
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
              SizedBox(
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
      ),
    );
  }

  bool validation() {
    if (emailController.text == '') {
      return false;
    } else if (passwordController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
