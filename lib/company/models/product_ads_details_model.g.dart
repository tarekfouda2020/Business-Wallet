// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_ads_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAdsDetailsModel _$ProductAdsDetailsModelFromJson(
    Map<String, dynamic> json) {
  return ProductAdsDetailsModel(
    id: json['id'] as int,
    date: json['date'] as String,
    show: json['show'] as int,
    count: json['count'] as int,
    name: json['name'] as String,
    userName: json['user_name'] as String,
    Id: json['Id'] as int,
    questions: (json['qustions_by_answer'] as List<dynamic>)
        .map((e) => CompQuestionModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProductAdsDetailsModelToJson(
        ProductAdsDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'show': instance.show,
      'count': instance.count,
      'name': instance.name,
      'user_name': instance.userName,
      'Id': instance.Id,
      'qustions_by_answer': instance.questions,
    };
