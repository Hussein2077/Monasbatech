import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasbatek/core/base_use_case/base_use_case.dart';
import 'package:monasbatek/core/utils/api_helper.dart';
import 'package:monasbatek/features/home/domain/use_case/get-items_uc.dart';
import 'package:monasbatek/features/home/presentation/bloc/get_items_bloc/get_items_event.dart';
import 'package:monasbatek/features/home/presentation/bloc/get_items_bloc/get_items_state.dart';

class ItemsBloc extends Bloc<BaseItemsEvent, ItemsState> {
  final GetItemsUseCase getItemsUseCase;

  ItemsBloc({
    required this.getItemsUseCase,
  }) : super(ItemsInitial()) {
    on<GetItemsEvent>((event, emit) async {
      emit(const ItemsLoadingState());
      final result = await getItemsUseCase.call(event.id);
      result.fold(
          (l) => emit(ItemsSuccessMessageState(items: l)),
          (r) => emit(ItemsErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
