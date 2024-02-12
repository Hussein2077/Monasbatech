import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasbatek/core/base_use_case/base_use_case.dart';
import 'package:monasbatek/core/utils/api_helper.dart';
import 'package:monasbatek/features/home/domain/use_case/get_category_uc.dart';
import 'package:monasbatek/features/home/domain/use_case/get_sub_cat_uc.dart';
import 'package:monasbatek/features/home/presentation/bloc/category_bloc/get_category_event.dart';
import 'package:monasbatek/features/home/presentation/bloc/category_bloc/get_category_state.dart';

class CategoriesBloc extends Bloc<BaseCategoriesEvent, CategoriesState> {
 final GetCategoryUseCase getCategoryUseCase;

  CategoriesBloc( {required this.getCategoryUseCase,})
      : super(CategoriesInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(const CategoriesLoadingState());
      final result = await getCategoryUseCase.call(const NoParameter());
      result.fold(
          (l) => emit(CategoriesSuccessMessageState(categories: l)),
          (r) => emit(CategoriesErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
