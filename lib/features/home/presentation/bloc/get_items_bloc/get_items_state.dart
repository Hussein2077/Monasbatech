import 'package:equatable/equatable.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';
import 'package:monasbatek/features/home/data/models/item_model.dart';

abstract class ItemsState extends Equatable {
  const ItemsState();

  @override
  List<Object> get props => [];
}

class ItemsInitial extends ItemsState {}

class ItemsLoadingState extends ItemsState {
  const ItemsLoadingState();
}

class ItemsErrorMessageState extends ItemsState {
  final String errorMessage;

  const ItemsErrorMessageState({required this.errorMessage});
}

class ItemsSuccessMessageState extends ItemsState {
  final List<ItemData> items;

  const ItemsSuccessMessageState({required this.items});
}
