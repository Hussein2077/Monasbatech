import 'package:dartz/dartz.dart';
import 'package:monasbatek/core/base_use_case/base_use_case.dart';
import 'package:monasbatek/core/error/failure.dart';
import 'package:monasbatek/core/models/my_data_model.dart';
import 'package:monasbatek/features/auth/domain/repo/base_repo.dart';

class SignUpWithEmailAndPasswordUseCase
    extends BaseUseCase<Map<String, dynamic>, SignUpModel> {
  BaseRepository baseRepository;

  SignUpWithEmailAndPasswordUseCase({required this.baseRepository});

  @override
  Future<Either<Map<String, dynamic>, Failure>> call(
      SignUpModel parameter) async {
    final result = await baseRepository.signUpWithEmailAndPassword(parameter);

    return result;
  }
}

class SignUpModel {
  final String? email;
  final String? password;
  final String? name;
  final String? phone;
  final String? code;

  SignUpModel({this.email, this.password, this.name, this.phone, this.code});
}
