import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/routes.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:monasbatek/features/auth/presentation/controller/login_bloc/login_with_email_and_password_events.dart';
import 'package:monasbatek/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';
import 'package:monasbatek/features/auth/presentation/widgets/auth_button.dart';
import 'package:monasbatek/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:monasbatek/features/auth/presentation/widgets/social_auth_row.dart';

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
  Widget build(BuildContext context) {
    SnackBar snackBar = const SnackBar(
      content: Text('please fill your data'),
      backgroundColor: Colors.red,
    );
    AppSize().init(context);
    return BlocConsumer<LoginWithEmailAndPasswordBloc,
        LoginWithEmailAndPasswordState>(
      listener: (context, state) {
        if (state is LoginWithEmailAndPasswordSuccessMessageState) {
          log(state.successMessage);
          Navigator.pushNamed(context, Routes.home);
        } else if (state is LoginWithEmailAndPasswordErrorMessageState) {
          SnackBar snackBar = const SnackBar(
            content: Text('Please enter correct data'),
            backgroundColor: Colors.red,
          );
          log(state.errorMessage);
          ScaffoldMessenger.of(context).showSnackBar(
            snackBar,
          );
        }
      },
      builder: (context, state) {
        return const SafeArea(
          child: Scaffold(),
        );
      },
    );
  }
}
