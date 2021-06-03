// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_interest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInterestModel _$UserInterestModelFromJson(Map<String, dynamic> json) {
  return UserInterestModel(
    id: json['Id'] as int,
    name: json['Name'] as String,
    choose: json['Choose'] as bool,
  );
}

Map<String, dynamic> _$UserInterestModelToJson(UserInterestModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Choose': instance.choose,
    };
