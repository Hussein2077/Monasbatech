import 'package:equatable/equatable.dart';

abstract class BaseSubCategoriesEvent extends Equatable {
  const BaseSubCategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetSubCategoriesEvent extends BaseSubCategoriesEvent {
final  String categoryID;
  const GetSubCategoriesEvent({required this.categoryID});
}
