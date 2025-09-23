import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String name;
  final String phone;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;
  final int gender;

  RegisterRequestBody({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.gender,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
