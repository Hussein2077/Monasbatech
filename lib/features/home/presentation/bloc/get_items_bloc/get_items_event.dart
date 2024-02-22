import 'package:equatable/equatable.dart';

abstract class BaseItemsEvent extends Equatable {
  const BaseItemsEvent();

  @override
  List<Object> get props => [];
}

class GetItemsEvent extends BaseItemsEvent {
 final String id;
  const GetItemsEvent(this.id);
}
