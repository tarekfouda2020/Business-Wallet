// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) {
  return FavoriteModel(
    hasAds: json['HasAds'] as int,
    typeAds: json['type_ads'] as int,
    imgAnnouncement:
        json['ImgAnnouncement_sent_specific_category_midea'] as String,
    favoriteDetailsModel: FavoriteDetailsModel.fromJson(
        json['UserAnnouncement_sent_specific_category_midea']
            as Map<String, dynamic>),
    rateSp: json['rateSp'] as int,
    adsId: json['Ads_Id'] as int,
    date: json['date1'] as String,
    numPoint: (json['num_point1'] as num).toDouble(),
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$FavoriteModelToJson(FavoriteModel instance) =>
    <String, dynamic>{
      'HasAds': instance.hasAds,
      'type_ads': instance.typeAds,
      'ImgAnnouncement_sent_specific_category_midea': instance.imgAnnouncement,
      'UserAnnouncement_sent_specific_category_midea':
          instance.favoriteDetailsModel,
      'rateSp': instance.rateSp,
      'Ads_Id': instance.adsId,
      'date1': instance.date,
      'num_point1': instance.numPoint,
      'count': instance.count,
    };
