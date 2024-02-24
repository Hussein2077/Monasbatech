import 'package:dartz/dartz.dart';
import 'package:monasbatek/core/base_use_case/base_use_case.dart';
import 'package:monasbatek/core/error/failure.dart';
import 'package:monasbatek/features/home/domain/repo/base_repo.dart';

class AddCartUseCase
    extends BaseUseCase<  Map<String, dynamic>, AddCartModel> {
  HomeBaseRepository homeBaseRepository;

  AddCartUseCase({required this.homeBaseRepository});

  @override
  Future<Either< Map<String, dynamic>, Failure>> call(parameter) async {
    final result = await homeBaseRepository.addToCart(parameter);
    return result;
  }
}
class AddCartModel {
  final String itemId;
  final String priceId;
  final String addressId;

  AddCartModel(
      {required this.itemId, required this.priceId, required this.addressId});
}
