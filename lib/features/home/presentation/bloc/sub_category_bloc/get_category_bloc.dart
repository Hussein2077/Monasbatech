import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasbatek/core/base_use_case/base_use_case.dart';
import 'package:monasbatek/core/utils/api_helper.dart';
import 'package:monasbatek/features/home/domain/use_case/add_cart_uc.dart';
import 'package:monasbatek/features/home/domain/use_case/get_category_uc.dart';
import 'package:monasbatek/features/home/domain/use_case/get_sub_cat_uc.dart';
import 'package:monasbatek/features/home/presentation/bloc/sub_category_bloc/get_category_event.dart';
import 'package:monasbatek/features/home/presentation/bloc/sub_category_bloc/get_category_state.dart';

class SubCategoriesBloc extends Bloc<BaseSubCategoriesEvent, SubCategoriesState> {
 final GetCategoryModelUseCase getCategoryModelUseCase;
 final AddCartUseCase addCartUseCase;

 SubCategoriesBloc(  {required this.getCategoryModelUseCase,required this.addCartUseCase,})
      : super(CategoriesInitial()) {

    on<GetSubCategoriesEvent>((event, emit) async {
      emit(const GetSubCategoriesLoadingState());
      final result = await getCategoryModelUseCase.call(event.categoryID);
      result.fold(
          (l) => emit(GetSubCategoriesSuccessMessageState(categories: l)),
          (r) => emit(GetSubCategoriesErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
    on<AddToCartEvent>((event, emit) async {
      emit(const AddToCartLoadingState());
      final result = await addCartUseCase.call(AddCartModel(
        itemId: event.itemId,
        addressId: event.addressId,
        priceId: event.priceId
      ));
      result.fold(
          (l) => emit(AddToCartSuccessMessageState(message: l['message'])),
          (r) => emit(AddToCartErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
