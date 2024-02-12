import 'package:equatable/equatable.dart';

abstract class BaseCategoriesEvent extends Equatable {
  const BaseCategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends BaseCategoriesEvent {
  const GetCategoriesEvent();
}
