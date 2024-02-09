import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/routes.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/app_bar.dart';
import 'package:monasbatek/core/widgets/main_button.dart';
import 'package:monasbatek/core/widgets/column_with_text_field.dart';
import 'package:monasbatek/core/widgets/snack_bar.dart';
import 'package:monasbatek/features/auth/presentation/controller/change_password_bloc/change_password_bloc.dart';
import 'package:monasbatek/features/auth/presentation/controller/change_password_bloc/change_password_events.dart';
import 'package:monasbatek/features/auth/presentation/controller/change_password_bloc/change_password_states.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        if (state is SendCodeSuccessMessageState) {
          EasyLoading.dismiss();
          Navigator.pushNamed(context, Routes.sendOTPCode,arguments: emailController.text);
        } else if (state is SendCodeErrorMessageState) {
          EasyLoading.dismiss();

          errorSnackBar(context, state.errorMessage);
        } else if (state is SendCodeLoadingState) {
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
            children: [
              Text(
                StringManager.weWillSend.tr(),
                maxLines: 4,
                style: TextStyle(
                    fontSize: AppSize.defaultSize! * 1.6,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis),
              ),
              ColumnWithTextField(
                text: StringManager.email.tr(),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: SvgPicture.asset(
                  AssetPath.emailIcon,
                ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 4,
              ),
              MainButton(
                text: StringManager.sendCode.tr(),
                onTap: () {
                  if(emailController.text!='') {
                    BlocProvider.of<ChangePasswordBloc>(context)
                      .add(SendCodeEvent(
                    email: emailController.text,
                  ));
                  }else{
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
