import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:monasbatek/core/models/my_data_model.dart';
import 'package:monasbatek/core/utils/api_helper.dart';
import 'package:monasbatek/core/utils/constant_api.dart';
import 'package:monasbatek/core/utils/methods.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';

abstract class HomeBaseRemotelyDataSource {
  Future<List<CategoryModel>> getCategory();
  Future<List<CategoryModel>> getSubCategory(String categoryID);
}

class HomeRemotelyDateSource extends HomeBaseRemotelyDataSource {
  @override
  Future<List<CategoryModel>> getCategory() async {
    Map<String, String> headers = await DioHelper().header();
    try {
      final response = await Dio().get(
        ConstantApi.category,
        options: Options(
          headers: headers,
        ),
      );
      List<CategoryModel> jsonData = List<CategoryModel>.from(
          (response.data as List)
              .map((e) => CategoryModel.fromJson(e)));

      return jsonData;
    } on DioError catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "getCategory");
    }
  }
  @override
  Future<List<CategoryModel>> getSubCategory(String categoryID) async {
    Map<String, String> headers = await DioHelper().header();
    try {
      final response = await Dio().get(
        ConstantApi.getSubCategory(categoryID),
        options: Options(
          headers: headers,
        ),
      );
      List<CategoryModel> jsonData = List<CategoryModel>.from(
          (response.data as List)
              .map((e) => CategoryModel.fromJson(e)));
      return jsonData;
    } on DioError catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "getCategoryModel");
    }
  }
}
