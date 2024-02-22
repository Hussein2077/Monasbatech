import 'package:dartz/dartz.dart';
import 'package:monasbatek/core/base_use_case/base_use_case.dart';
import 'package:monasbatek/core/error/failure.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';
import 'package:monasbatek/features/home/data/models/item_model.dart';
import 'package:monasbatek/features/home/domain/repo/base_repo.dart';
class GetItemsUseCase
    extends BaseUseCase< List<ItemData>, String > {
  HomeBaseRepository homeBaseRepository;

  GetItemsUseCase({required this.homeBaseRepository});

  @override
  Future<Either< List<ItemData>, Failure>> call(parameter) async {
    final result = await homeBaseRepository.getItems(parameter);
    return result;
  }
}