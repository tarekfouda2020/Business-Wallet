import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable(nullable: true)
class CustomerModel {
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "img_user")
  String? imgUser;
  @JsonKey(name: "UserName")
  String? userName;
  @JsonKey(name: "Email")
  String? email;
  @JsonKey(name: "PhoneNumber")
  String? phoneNumber;
  @JsonKey(name: "country_code")
  String? countryCode;
  @JsonKey(name: "gender_user")
  String? genderUser;
  @JsonKey(name: "lat_user")
  String? latUser;
  @JsonKey(name: "lng_user")
  String? lngUser;
  @JsonKey(name: "user_address")
  String? userAddress;
  @JsonKey(name: "birth_date_user")
  String? birthDateUser;
  @JsonKey(name: "fk_country")
  int? fkCountry;
  @JsonKey(name: "fk_city")
  int? fkCity;

  @JsonKey(name: "cityname")
  String? cityName;
  @JsonKey(name: "countryname")
  String? countryName;
  @JsonKey(name: "promo_code")
  String? promoCode;
  @JsonKey(name: "accommodation_type")
  String? accommodationType;
  @JsonKey(name: "education_level")
  String? educationLevel;
  @JsonKey(name: "num_family")
  String? numFamily;
  @JsonKey(name: "Average_income_per_year")
  String? averageIncomePerYear;

  @JsonKey(name: "active")
  bool? active;


  CustomerModel({
   required this.userId,
    this.imgUser,
    this.userName,
    this.email,
    this.phoneNumber,
    this.countryCode,
    this.genderUser,
    this.latUser,
    this.lngUser,
    this.userAddress,
    this.birthDateUser,
    this.fkCountry,
    this.fkCity,
    this.cityName,
    this.countryName,
    this.promoCode,
    this.accommodationType,
    this.educationLevel,
    this.numFamily,
    this.averageIncomePerYear,
    this.active,

  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
