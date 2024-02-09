import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:monasbatek/core/error/exception.dart';
import 'package:monasbatek/core/error/failure.dart';
import 'package:monasbatek/core/error/failures_strings.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/methods.dart';

class DioHelper {
  Future<Map<String, String>> header() async {
    String token = await Methods.instance.returnUserToken();

    if (kDebugMode) {
      log(token);
    }
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      // "device": devicedata ?? 'noToken',
      "Accept": 'application/json',
      // "X-localization": key,
    };
    return headers;
  }

  String getTypeOfFailure(
    Failure failure,
  ) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Strings.serverFailureMessage.tr();
      case UnauthorizedFailure:
        return Strings.unauthorizedFailureMassage.tr();

      case InternetFailure:
        return Strings.checkYourInternet.tr();

      default:
        return failure.errorMessage ?? StringManager.unexpectedError.tr();
    }
  }

  static Failure buildFailure(dynamic e, {String? message1}) {
    switch (e.runtimeType) {
      case ServerException:
        return ServerFailure();
      case UnauthorizedException:
        return UnauthorizedFailure();
      case InternetException:
        return InternetFailure();
      case ErrorModelException:
        return ErrorMessageFailure(message: e.errorMessage);
      default:
        return ErrorMessageFailure(message: e.toString());
    }
  }

  static dynamic handleDioError({DioError? dioError, String? endpointName}) {
    if (kDebugMode) {
      log("dioError${dioError?.message}");
      log('endpointName$endpointName');
    }

    switch (dioError!.type) {
      case DioErrorType.response:
        throw handleStatuesCodeResponse(
            response: dioError.response, endpointName: endpointName);
      case DioErrorType.other:
        throw InternetException();
      case DioErrorType.cancel:
        throw handleStatuesCodeResponse(
            response: dioError.response, endpointName: endpointName);

      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.connectTimeout:
        throw ConnectionTimeoutException();
    }
  }

  static Exception handleStatuesCodeResponse(
      {Response? response, String? endpointName}) {
    if (kDebugMode) {
      log("endpointName =$endpointName");
      log("statescode${response?.statusCode}");
      log("errore respomse${response?.data}");
    }
    switch (response?.statusCode) {
      case 500:
        if (response?.data.runtimeType == String) {
          throw ErrorModelException(errorMessage: response!.data);
        } else {
          throw ErrorModelException.fromJson(response!.data);
        }
        throw ServerException();
      case 401:
        throw UnauthorizedException();
      case 404:
        if (response?.data.runtimeType == String) {
          throw ErrorModelException(errorMessage: response!.data, code: 404);
        } else {
          throw ErrorModelException.fromJson(response!.data, code: 404);
        }

      default:
        if (response?.data.runtimeType == String) {
          throw ErrorModelException(errorMessage: response!.data,code: 400);
        } else {
          throw ErrorModelException.fromJson(response!.data,code: 400);
        }
    }
  }
}
