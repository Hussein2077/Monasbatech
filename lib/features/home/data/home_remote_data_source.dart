import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:monasbatek/core/models/my_data_model.dart';
import 'package:monasbatek/core/utils/api_helper.dart';
import 'package:monasbatek/core/utils/constant_api.dart';
import 'package:monasbatek/core/utils/methods.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';
import 'package:monasbatek/features/home/data/models/item_model.dart';
import 'package:monasbatek/features/home/domain/use_case/add_cart_uc.dart';

abstract class HomeBaseRemotelyDataSource {
  Future<List<CategoryModel>> getCategory();

  Future<List<CategoryModel>> getSubCategory(String categoryID);

  Future<List<ItemData>> getItems(String subCategoryID);

  Future<Map<String, dynamic>> addTOCart(AddCartModel addCartModel);
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
          (response.data as List).map((e) => CategoryModel.fromJson(e)));

      return jsonData;
    } on DioError catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: "getCategory");
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
          (response.data as List).map((e) => CategoryModel.fromJson(e)));
      return jsonData;
    } on DioError catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "getCategoryModel");
    }
  }

  @override
  Future<List<ItemData>> getItems(String subCategoryID) async {
    Map<String, String> headers = await DioHelper().header();
    try {
      final response = await Dio().get(
        ConstantApi.getItems(subCategoryID),
        options: Options(
          headers: headers,
        ),
      );
      log('${subCategoryID}sssssssss');
      List<ItemData> jsonData = List<ItemData>.from(
          (response.data['data'] as List).map((e) => ItemData.fromJson(e)));
      log('${jsonData}sssssssss');

      return jsonData;
    } on DioError catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: "getItems");
    }
  }

  @override
  Future<Map<String, dynamic>> addTOCart(AddCartModel addCartModel) async {
    final body = {
      'item_id': addCartModel.itemId,
      'prices_id': addCartModel.priceId,
      'address_id': addCartModel.addressId,
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
}

