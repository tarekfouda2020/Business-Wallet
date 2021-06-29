// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specific_ads_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecificAdsDetailsModel _$SpecificAdsDetailsModelFromJson(
    Map<String, dynamic> json) {
  return SpecificAdsDetailsModel(
    date: json['date'] as String,
    fav: json['fav'] as int,
    rate: json['rate'] as int,
    like: json['like'] as int,
    name: json['name'] as String,
    userName: json['user_name'] as String,
    id: json['id'] as int,
    show: json['show'] as int,
    count: json['count'] as int,
    showProfile: json['showProfile'] as int,
    adsCountShare: json['ads_count_share'] as int,
  );
}

Map<String, dynamic> _$SpecificAdsDetailsModelToJson(
        SpecificAdsDetailsModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'fav': instance.fav,
      'rate': instance.rate,
      'like': instance.like,
      'name': instance.name,
      'user_name': instance.userName,
      'id': instance.id,
      'show': instance.show,
      'count': instance.count,
      'showProfile': instance.showProfile,
      'ads_count_share': instance.adsCountShare,
    };
