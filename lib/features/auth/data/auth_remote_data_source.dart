import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:monasbatek/core/models/my_data_model.dart';
import 'package:monasbatek/core/utils/api_helper.dart';
import 'package:monasbatek/core/utils/constant_api.dart';
import 'package:monasbatek/core/utils/methods.dart';
import 'package:monasbatek/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:monasbatek/features/auth/domain/use_case/sign_up_use_case.dart';

abstract class BaseRemotelyDataSource {
  Future<Map<String, dynamic>> loginWithEmailAndPassword(AuthModel authModel);

  Future<Map<String, dynamic>> signUpWithEmailAndPassword(
      SignUpModel signUpModel);

  Future<Map<String, dynamic>> sendCode(SignUpModel signUpModel);

  Future<Map<String, dynamic>> verifyCode(SignUpModel signUpModel);

  Future<Map<String, dynamic>> changePassword(SignUpModel signUpModel);
}

class AuthRemotelyDateSource extends BaseRemotelyDataSource {
  @override
  Future<Map<String, dynamic>> loginWithEmailAndPassword(
      AuthModel authModel) async {
    log('${authModel.email}vvvvv');
    log('${authModel.password}vvvvv');
    final body = {
      ConstantApi.email: authModel.email,
      ConstantApi.password: authModel.password,
    };

    try {
      final response = await Dio().post(
        ConstantApi.login,
        data: body,
      );
      log('${response.data}sssssssss');

      Map<String, dynamic> jsonData = response.data;
      Methods.instance.saveUserToken(authToken: jsonData['access_token']);
      log('${jsonData}sssssssss');

      return jsonData;
    } on DioError catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "loginWithEmailAndPassword");
    }
  }

  @override
  Future<Map<String, dynamic>> signUpWithEmailAndPassword(
      SignUpModel signUpModel) async {
    final body = {
      ConstantApi.email: signUpModel.email,
      ConstantApi.password: signUpModel.password,
      'name': signUpModel.name,
      'phone': signUpModel.phone,
    };

    try {
      final response = await Dio().post(
        ConstantApi.signUp,
        data: body,
      );
      Map<String, dynamic> jsonData = response.data;
      Methods.instance.saveUserToken(authToken: jsonData['access_token']);
      return jsonData;
    } on DioError catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "signUpWithEmailAndPassword");
    }
  }

  @override
  Future<Map<String, dynamic>> changePassword(SignUpModel signUpModel) async {
    final body = {
      ConstantApi.password: signUpModel.password,
    };

    try {
      final response = await Dio().post(
        ConstantApi.login,
        data: body,
      );

      Map<String, dynamic> jsonData = response.data;

      return jsonData;
    } on DioError catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "changePassword");
    }
  }

  @override
  Future<Map<String, dynamic>> sendCode(SignUpModel signUpModel) async {
    final body = {
      ConstantApi.email: signUpModel.email,
    };

    try {
      final response = await Dio().post(
        ConstantApi.sendCode,
        data: body,
      );

      Map<String, dynamic> jsonData = response.data;

      return jsonData;
    } on DioError catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "changePassword");
    }
  }

  @override
  Future<Map<String, dynamic>> verifyCode(SignUpModel signUpModel) async {
    final body = {
      ConstantApi.email: signUpModel.email,
      'verification_code': signUpModel.code,
    };

    try {
      final response = await Dio().post(
        ConstantApi.verifyCode,
        data: body,
      );

      Map<String, dynamic> jsonData = response.data;

      return jsonData;
    } on DioError catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: "verifyCode");
    }
  }
}
