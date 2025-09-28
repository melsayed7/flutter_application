import 'package:freezed_annotation/freezed_annotation.dart';

part 'specializations_response_model.g.dart';

@JsonSerializable()
class SpecializationsResponseModel {
  @JsonKey(name: 'data')
  List<SpecializationsData> specializationDataList;

  SpecializationsResponseModel(this.specializationDataList);

  factory SpecializationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsResponseModelFromJson(json);
}

@JsonSerializable()
class SpecializationsData {
  final int id;
  final String name;
  @JsonKey(name: 'doctors')
  final List<DoctorsModel> doctorModel;

  SpecializationsData(this.id, this.name, this.doctorModel);

  factory SpecializationsData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsDataFromJson(json);
}

@JsonSerializable()
class DoctorsModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String photo;
  final String degree;
  @JsonKey(name: 'appoint_price')
  final int price;

  DoctorsModel(
    this.id,
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.photo,
    this.degree,
    this.price,
  );

  factory DoctorsModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorsModelFromJson(json);
}
