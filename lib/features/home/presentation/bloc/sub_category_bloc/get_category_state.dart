import 'package:equatable/equatable.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';

abstract class SubCategoriesState extends Equatable {
  const SubCategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends SubCategoriesState {}
class GetSubCategoriesLoadingState extends SubCategoriesState {
  const GetSubCategoriesLoadingState();
}

class GetSubCategoriesErrorMessageState extends SubCategoriesState {
  final String errorMessage;

  const GetSubCategoriesErrorMessageState({required this.errorMessage});
}

class GetSubCategoriesSuccessMessageState extends SubCategoriesState {
  final List<CategoryModel> categories;

  const GetSubCategoriesSuccessMessageState({required this.categories});
}
