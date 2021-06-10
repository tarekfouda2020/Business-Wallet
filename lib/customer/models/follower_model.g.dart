// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowerModel _$FollowerModelFromJson(Map<String, dynamic> json) {
  return FollowerModel(
    id: json['Id'] as String,
    name: json['Name'] as String,
    background: json['Background'] as String,
    img: json['Img'] as String,
    rate: (json['Rate'] as num).toDouble(),
    count: json['Count'] as int,
    numberEdit: json['NumberEdit'] as int,
  );
}

Map<String, dynamic> _$FollowerModelToJson(FollowerModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Background': instance.background,
      'Img': instance.img,
      'Rate': instance.rate,
      'Count': instance.count,
      'NumberEdit': instance.numberEdit,
    };
