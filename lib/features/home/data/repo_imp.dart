import 'package:dartz/dartz.dart';
import 'package:monasbatek/core/error/failure.dart';
import 'package:monasbatek/core/models/my_data_model.dart';
import 'package:monasbatek/core/utils/api_helper.dart';
import 'package:monasbatek/features/home/data/home_remote_data_source.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';
import 'package:monasbatek/features/home/data/models/item_model.dart';
import 'package:monasbatek/features/home/domain/repo/base_repo.dart';

class HomeRepositoryImp extends HomeBaseRepository {
  final HomeBaseRemotelyDataSource homeBaseRemotelyDataSource;

  HomeRepositoryImp({required this.homeBaseRemotelyDataSource});

  @override
  Future<Either< List<CategoryModel>, Failure>> getCategory( ) async {
    try {
      final result =
          await homeBaseRemotelyDataSource.getCategory();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
  @override
  Future<Either< List<CategoryModel>, Failure>> getSubCategory(String categoryID) async {
    try {
      final result =
          await homeBaseRemotelyDataSource.getSubCategory(categoryID);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  } @override
  Future<Either< List<ItemData>, Failure>> getItems(String subCategoryID) async {
    try {
      final result =
          await homeBaseRemotelyDataSource.getItems(subCategoryID);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }



}
