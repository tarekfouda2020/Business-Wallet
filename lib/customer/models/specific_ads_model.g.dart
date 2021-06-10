// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specific_ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecificAdsModel _$SpecificAdsModelFromJson(Map<String, dynamic> json) {
  return SpecificAdsModel(
    previewAds: AdsDetailsModel.fromJson(
        json['perviewAdvertisment'] as Map<String, dynamic>),
    kayanOwner:
        KayanOwnerModel.fromJson(json['KayanOwner'] as Map<String, dynamic>),
    myInterests:
        MyInterestsModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SpecificAdsModelToJson(SpecificAdsModel instance) =>
    <String, dynamic>{
      'perviewAdvertisment': instance.previewAds,
      'KayanOwner': instance.kayanOwner,
      'data': instance.myInterests,
    };
