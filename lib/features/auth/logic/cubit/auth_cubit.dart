import 'package:flutter_application/features/auth/data/models/login_request_body.dart';
import 'package:flutter_application/features/auth/data/models/register_request_body.dart';
import 'package:flutter_application/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_application/features/auth/logic/cubit/auth_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(const AuthState.initial());

  void login(LoginRequestBody loginRequestBody) async {
    emit(const AuthState.loading());
    final result = await _authRepo.login(loginRequestBody);
    result.when(
      success: (data) {
        emit(AuthState.loaded(data));
      },
      failure: (errorHandler) {
        emit(AuthState.error(errorHandler.apiErrorModel.message ?? ''));
      },
    );
  }

  void register(RegisterRequestBody registerRequestBody) async {
    emit(const AuthState.loading());
    final result = await _authRepo.register(registerRequestBody);
    result.when(
      success: (data) {
        emit(AuthState.loaded(data));
      },
      failure: (errorHandler) {
        emit(AuthState.error(errorHandler.apiErrorModel.message ?? ''));
      },
    );
  }
}
