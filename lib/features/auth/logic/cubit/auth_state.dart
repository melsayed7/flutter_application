import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState<T> with _$AuthState<T> {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.loaded(T data) = AuthLoaded<T>;
  const factory AuthState.error(String message) = AuthError;
}
