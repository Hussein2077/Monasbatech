import 'package:equatable/equatable.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {
  const CategoriesLoadingState();
}

class CategoriesErrorMessageState extends CategoriesState {
  final String errorMessage;

  const CategoriesErrorMessageState({required this.errorMessage});
}

class CategoriesSuccessMessageState extends CategoriesState {
  final List<CategoryModel> categories;

  const CategoriesSuccessMessageState({required this.categories});
}
