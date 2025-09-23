import 'package:json_annotation/json_annotation.dart';

part 'register_response_body.g.dart';

@JsonSerializable()
class RegisterResponseBody {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;

  RegisterResponseBody({this.message, this.userData, this.status, this.code});

  factory RegisterResponseBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseBodyFromJson(json);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'username')
  final String userName;
  final String token;

  UserData({
    required this.userName,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
