import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login({
      'email': emailController.text,
      'password': passwordController.text,
    });
    response.when(
      success: (data) => emit(LoginState.success(data)),
      failure: (errorHandler) => emit(LoginState.error(errorHandler.message)),
    );
  }
}
