// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_ads_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAdsDetailsModel _$BusinessAdsDetailsModelFromJson(
    Map<String, dynamic> json) {
  return BusinessAdsDetailsModel(
    date: json['date'] as String,
    show: json['show'] as int,
    count: json['count'] as int,
    name: json['name'] as String,
    userName: json['user_name'] as String,
    id: json['id'] as int,
    cost: json['cost'] as int,
    countShow: json['count_show'] as int,
  );
}

Map<String, dynamic> _$BusinessAdsDetailsModelToJson(
        BusinessAdsDetailsModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'show': instance.show,
      'count': instance.count,
      'name': instance.name,
      'user_name': instance.userName,
      'id': instance.id,
      'cost': instance.cost,
      'count_show': instance.countShow,
    };
