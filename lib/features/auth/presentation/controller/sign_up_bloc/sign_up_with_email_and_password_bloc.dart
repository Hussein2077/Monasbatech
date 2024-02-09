import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/api_helper.dart';
import 'package:monasbatek/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:monasbatek/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_events.dart';
import 'package:monasbatek/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_states.dart';

class SignUpWithEmailAndPasswordBloc extends Bloc<
    BaseSignUpWithEmailAndPasswordEvent, SignUpWithEmailAndPasswordState> {
  SignUpWithEmailAndPasswordUseCase signUpWithEmailAndPasswordUseCase;

  SignUpWithEmailAndPasswordBloc(
      {required this.signUpWithEmailAndPasswordUseCase})
      : super(SignUpWithEmailAndPasswordInitial()) {
    on<SignUpWithEmailAndPasswordEvent>((event, emit) async {
      emit(const SignUpWithEmailAndPasswordLoadingState());
      final result = await signUpWithEmailAndPasswordUseCase.call(SignUpModel(
          email: event.email,
          password: event.password,
          phone: event.phone,
          name: event.name));
      result.fold(
          (l) => emit(const SignUpWithEmailAndPasswordSuccessMessageState(
              successMessage: StringManager.loginSuccessfully)),
          (r) => emit(SignUpWithEmailAndPasswordErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
