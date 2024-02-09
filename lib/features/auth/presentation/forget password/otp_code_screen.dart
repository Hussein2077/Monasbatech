import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/routes.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/app_bar.dart';
import 'package:monasbatek/core/widgets/main_button.dart';
import 'package:monasbatek/core/widgets/snack_bar.dart';
import 'package:monasbatek/features/auth/presentation/controller/change_password_bloc/change_password_bloc.dart';
import 'package:monasbatek/features/auth/presentation/controller/change_password_bloc/change_password_events.dart';
import 'package:monasbatek/features/auth/presentation/controller/change_password_bloc/change_password_states.dart';
import 'package:monasbatek/features/auth/presentation/forget%20password/widgets/pin_text_field.dart';

class OTPCodeScreen extends StatefulWidget {
  const OTPCodeScreen({super.key, required this.email});

  final String email;

  @override
  State<OTPCodeScreen> createState() => _OTPCodeScreenState();
}

class _OTPCodeScreenState extends State<OTPCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        if (state is VerifyCodeSuccessMessageState) {
          EasyLoading.dismiss();
          Navigator.pushNamed(context, Routes.changePassword);
        } else if (state is VerifyCodeErrorMessageState) {
          EasyLoading.dismiss();
          log('${state.errorMessage}sssssssssss');
          errorSnackBar(context, state.errorMessage);
        } else if (state is VerifyCodeLoadingState) {
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
          padding: EdgeInsets.all(AppSize.defaultSize! * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringManager.pleaseEnterYOurCode.tr(),
                maxLines: 4,
                style: TextStyle(
                    fontSize: AppSize.defaultSize! * 1.6,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 4,
              ),
              const CustomPinCodeTextField(),
              Text(
                '${StringManager.youCanResend.tr()}2.00',
                maxLines: 4,
                style: TextStyle(
                    fontSize: AppSize.defaultSize! * 1.6,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<ChangePasswordBloc>(context)
                      .add(SendCodeEvent(
                    email: widget.email,
                  ));

                },
                child: Text(
                  StringManager.resendCode.tr(),
                  maxLines: 4,
                  style: TextStyle(
                      fontSize: AppSize.defaultSize! * 1.7,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.grey,
                      decorationThickness: 2,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              MainButton(
                text: StringManager.verify.tr(),
                onTap: () {
                  if (CustomPinCodeTextField.otpCode != '' &&
                      CustomPinCodeTextField.otpCode.length == 6) {
                    BlocProvider.of<ChangePasswordBloc>(context)
                        .add(VerifyCodeEvent(
                      email: widget.email,
                      code: CustomPinCodeTextField.otpCode,
                    ));

                  } else {
                    errorSnackBar(context, StringManager.pleaseFill.tr());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
