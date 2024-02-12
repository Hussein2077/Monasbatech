import 'package:dartz/dartz.dart';
import 'package:monasbatek/core/base_use_case/base_use_case.dart';
import 'package:monasbatek/core/error/failure.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';
import 'package:monasbatek/features/home/domain/repo/base_repo.dart';
class GetCategoryUseCase
    extends BaseUseCase< List<CategoryModel>, NoParameter> {
  HomeBaseRepository homeBaseRepository;

  GetCategoryUseCase({required this.homeBaseRepository});

  @override
  Future<Either< List<CategoryModel>, Failure>> call(parameter) async {
    final result = await homeBaseRepository.getCategory();
    return result;
  }
}