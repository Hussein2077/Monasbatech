import 'package:dartz/dartz.dart';
import 'package:monasbatek/core/error/failure.dart';
import 'package:monasbatek/core/models/my_data_model.dart';
import 'package:monasbatek/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:monasbatek/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';
import 'package:monasbatek/features/home/data/models/item_model.dart';
import 'package:monasbatek/features/home/domain/use_case/add_cart_uc.dart';

abstract class HomeBaseRepository {
  Future<Either< List<CategoryModel>, Failure>> getCategory();
  Future<Either< List<CategoryModel>, Failure>> getSubCategory(String categoryID);
  Future<Either< List<ItemData>, Failure>> getItems(String subCategoryID);
  Future<Either< Map<String, dynamic>, Failure>> addToCart(AddCartModel addCartModel);

}
