// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return CustomerModel(
    userId: json['user_id'] as String,
    imgUser: json['img_user'] as String?,
    userName: json['UserName'] as String?,
    email: json['Email'] as String?,
    phoneNumber: json['PhoneNumber'] as String?,
    countryCode: json['country_code'] as String?,
    genderUser: json['gender_user'] as String?,
    latUser: json['lat_user'] as String?,
    lngUser: json['lng_user'] as String?,
    userAddress: json['user_address'] as String?,
    birthDateUser: json['birth_date_user'] as String?,
    fkCountry: json['fk_country'] as int?,
    fkCity: json['fk_city'] as int?,
    cityName: json['cityname'] as String?,
    countryName: json['countryname'] as String?,
    promoCode: json['promo_code'] as String?,
    accommodationType: json['accommodation_type'] as String?,
    educationLevel: json['education_level'] as String?,
    numFamily: json['num_family'] as String?,
    averageIncomePerYear: json['Average_income_per_year'] as String?,
    active: json['active'] as bool?,
  );
}

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'img_user': instance.imgUser,
      'UserName': instance.userName,
      'Email': instance.email,
      'PhoneNumber': instance.phoneNumber,
      'country_code': instance.countryCode,
      'gender_user': instance.genderUser,
      'lat_user': instance.latUser,
      'lng_user': instance.lngUser,
      'user_address': instance.userAddress,
      'birth_date_user': instance.birthDateUser,
      'fk_country': instance.fkCountry,
      'fk_city': instance.fkCity,
      'cityname': instance.cityName,
      'countryname': instance.countryName,
      'promo_code': instance.promoCode,
      'accommodation_type': instance.accommodationType,
      'education_level': instance.educationLevel,
      'num_family': instance.numFamily,
      'Average_income_per_year': instance.averageIncomePerYear,
      'active': instance.active,
    };
