// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentAdsModel _$InvestmentAdsModelFromJson(Map<String, dynamic> json) {
  return InvestmentAdsModel(
    investmentAdsDetails: InvestmentAdsDetailsModel.fromJson(
        json['perviewAdvertisment'] as Map<String, dynamic>),
    kayanOwner:
        KayanOwnerModel.fromJson(json['KayanOwner'] as Map<String, dynamic>),
    questions: (json['Qusetions'] as List<dynamic>)
        .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$InvestmentAdsModelToJson(InvestmentAdsModel instance) =>
    <String, dynamic>{
      'perviewAdvertisment': instance.investmentAdsDetails,
      'KayanOwner': instance.kayanOwner,
      'Qusetions': instance.questions,
    };
