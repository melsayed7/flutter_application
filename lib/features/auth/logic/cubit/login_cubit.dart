import 'package:flutter_application/features/auth/data/models/login_request_body.dart';
import 'package:flutter_application/features/auth/data/repo/login_repo.dart';
import 'package:flutter_application/features/auth/logic/cubit/login_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void login(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final result = await _loginRepo.login(loginRequestBody);
    result.when(
      success: (data) {
        emit(LoginState.loaded(data));
      },
      failure: (errorHandler) {
        emit(LoginState.error(errorHandler.apiErrorModel.message ?? ''));
      },
    );
  }
}
