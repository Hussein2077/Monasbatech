import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasbatek/core/base_use_case/base_use_case.dart';
import 'package:monasbatek/core/utils/api_helper.dart';
import 'package:monasbatek/features/home/domain/use_case/get_category_uc.dart';
import 'package:monasbatek/features/home/domain/use_case/get_sub_cat_uc.dart';
import 'package:monasbatek/features/home/presentation/bloc/sub_category_bloc/get_category_event.dart';
import 'package:monasbatek/features/home/presentation/bloc/sub_category_bloc/get_category_state.dart';

class SubCategoriesBloc extends Bloc<BaseSubCategoriesEvent, SubCategoriesState> {
 final GetCategoryModelUseCase getCategoryModelUseCase;

 SubCategoriesBloc( {required this.getCategoryModelUseCase,})
      : super(CategoriesInitial()) {

    on<GetSubCategoriesEvent>((event, emit) async {
      emit(const GetSubCategoriesLoadingState());
      final result = await getCategoryModelUseCase.call(event.categoryID);
      result.fold(
          (l) => emit(GetSubCategoriesSuccessMessageState(categories: l)),
          (r) => emit(GetSubCategoriesErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
