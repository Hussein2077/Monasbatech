import 'package:dartz/dartz.dart';
import 'package:monasbatek/core/base_use_case/base_use_case.dart';
import 'package:monasbatek/core/error/failure.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';
import 'package:monasbatek/features/home/domain/repo/base_repo.dart';
class GetCategoryModelUseCase
    extends BaseUseCase< List<CategoryModel>, String> {
  HomeBaseRepository homeBaseRepository;

  GetCategoryModelUseCase({required this.homeBaseRepository});

  @override
  Future<Either< List<CategoryModel>, Failure>> call(parameter) async {
    final result = await homeBaseRepository.getSubCategory(parameter);
    return result;
  }
}
