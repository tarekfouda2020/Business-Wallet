import 'package:json_annotation/json_annotation.dart';

part 'comp_register_model.g.dart';

@JsonSerializable(nullable: true)
class CompRegisterModel {
  @JsonKey(name: "user_name")
  String? userName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "code_phone")
  String? codePhone;
  @JsonKey(name: "Lat")
  String? lat;
  @JsonKey(name: "Lng")
  String? lng;
  @JsonKey(name: "Address")
  String? address;
  @JsonKey(name: "fK_country")
  int? fKCountry;
  @JsonKey(name: "fK_city")
  int? fKCity;
  @JsonKey(name: "kayan_name")
  String? kayanName;
  @JsonKey(name: "kayan_email")
  String? kayanEmail;
  @JsonKey(name: "kayan_phone")
  String? kayanPhone;
  @JsonKey(name: "kayan_phone_code")
  String? kayanPhoneCode;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "promo_code")
  String? promoCode;
  @JsonKey(name: "lang")
  String? lang;
  @JsonKey(name: "device_id")
  String? deviceId;

  CompRegisterModel(
      {this.userName,
      this.email,
      this.phone,
      this.codePhone,
      this.lat,
      this.lng,
      this.address,
      this.fKCountry,
      this.fKCity,
      this.kayanName,
      this.kayanEmail,
      this.kayanPhone,
      this.kayanPhoneCode,
      this.password,
      this.promoCode,
      this.lang,
      this.deviceId});

  factory CompRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$CompRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompRegisterModelToJson(this);
}
