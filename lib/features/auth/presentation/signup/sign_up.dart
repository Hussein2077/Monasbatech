import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/routes.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/app_bar.dart';
import 'package:monasbatek/core/widgets/column_with_text_field.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/core/widgets/main_button.dart';
import 'package:monasbatek/core/widgets/phone_with_country.dart';
import 'package:monasbatek/core/widgets/snack_bar.dart';
import 'package:monasbatek/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:monasbatek/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_events.dart';
import 'package:monasbatek/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_states.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;
  late TextEditingController nameController;

  @override
  void initState() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    nameController.dispose();
    super.dispose();
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpWithEmailAndPasswordBloc,
        SignUpWithEmailAndPasswordState>(
      listener: (context, state) {
        if (state is SignUpWithEmailAndPasswordSuccessMessageState) {
          EasyLoading.dismiss();

          Navigator.pushNamedAndRemoveUntil(
              context, Routes.home, (route) => false);
        } else if (state is SignUpWithEmailAndPasswordErrorMessageState) {
          EasyLoading.dismiss();

          errorSnackBar(context, state.errorMessage);
        } else if (state is SignUpWithEmailAndPasswordLoadingState) {
          EasyLoading.show(status: 'loading...');
        }
      },
      child: Scaffold(
        appBar: homeAppBar(context,
            widget: Image.asset(
              AssetPath.logo,
              scale: 2,
            )),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.defaultSize! * 4,
                ),
                CustomText(
                  text: StringManager.signUp.tr(),
                  fontSize: AppSize.defaultSize! * 2,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 1.6,
                ),
                CustomText(
                  text: StringManager.pleaseFill.tr(),
                  fontSize: AppSize.defaultSize! * 1.5,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 3.2,
                ),
                ColumnWithTextField(
                  text: StringManager.fullName.tr(),
                  controller: nameController,
                  suffixIcon: const Icon(
                    Icons.person,
                    color: AppColors.secondaryBackGroundColor,
                  ),
                ),
                ColumnWithTextField(
                  text: StringManager.email.tr(),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: SvgPicture.asset(
                    AssetPath.emailIcon,
                  ),
                ),
                // PhoneWithCountry(),
                ColumnWithTextField(
                  text: StringManager.phoneNum.tr(),
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  suffixIcon: const Icon(
                    Icons.phone,
                    color: AppColors.secondaryBackGroundColor,
                  ),
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 3,
                ),
                ColumnWithTextField(
                  text: StringManager.password.tr(),
                  controller: passwordController,

                  prefixIcon: SvgPicture.asset(
                    AssetPath.lock,
                    color: AppColors.secondaryBackGroundColor,
                  ),
                  obscureText: isVisible,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      isVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.secondaryBackGroundColor,
                    ),
                  ),
                ),
                ColumnWithTextField(
                  text: StringManager.confirmPassword.tr(),
                  prefixIcon: SvgPicture.asset(
                    AssetPath.lock,
                    color: AppColors.secondaryBackGroundColor,
                  ),
                  obscureText: isVisible,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      isVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.secondaryBackGroundColor,
                    ),
                  ),
                  controller: passwordConfirmController,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 3,
                ),
                MainButton(
                  text: StringManager.signUp.tr(),
                  onTap: () {
                    if (validation()) {
                      BlocProvider.of<SignUpWithEmailAndPasswordBloc>(context)
                          .add(SignUpWithEmailAndPasswordEvent(
                        phone: phoneController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        email: emailController.text,
                      ));
                    } else {

                      errorSnackBar(context, StringManager.pleaseFill.tr());
                    }
                  },
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validation() {
    if (emailController.text == '') {
      return false;
    } else if (nameController.text == '') {
      return false;
    } else if (phoneController.text == '') {
      return false;
    } else if (passwordController.text == '') {
      return false;
    } else if (passwordConfirmController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
