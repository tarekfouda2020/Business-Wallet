import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable(nullable: true)
class RegisterModel {
  @JsonKey(name: "UserName")
  String? userName;
  @JsonKey(name: "Email")
  String? email;
  @JsonKey(name: "Phone")
  String? phone;
  @JsonKey(name: "CodePhone")
  String? codePhone;
  @JsonKey(name: "FK_Country")
  int? fKCountry;
  @JsonKey(name: "FK_City")
  int? fKCity;
  @JsonKey(name: "Lat")
  double? lat;
  @JsonKey(name: "Lng")
  double? lng;
  @JsonKey(name: "Address")
  String? address;
  @JsonKey(name: "Gender")
  String? gender;
  @JsonKey(name: "BirthDate")
  String? birthDate;
  @JsonKey(name: "Password")
  String? password;
  @JsonKey(name: "lang")
  String? lang;
  @JsonKey(name: "device_id")
  String? deviceId;

  RegisterModel(
      {this.userName,
      this.email,
      this.phone,
      this.codePhone,
      this.fKCountry,
      this.fKCity,
      this.lat,
      this.lng,
      this.address,
      this.gender,
      this.birthDate,
      this.password,
      this.lang,
      this.deviceId});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
