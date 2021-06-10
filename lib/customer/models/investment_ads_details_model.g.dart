// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_ads_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentAdsDetailsModel _$InvestmentAdsDetailsModelFromJson(
    Map<String, dynamic> json) {
  return InvestmentAdsDetailsModel(
    id: json['Id'] as int,
    advertDescription: json['advert_description'] as String,
    userId: json['UserId'] as String,
    type: json['type'] as int,
    point: (json['point'] as num).toDouble(),
    countView: json['count_view'] as int,
    time: json['time'] as int,
    myRate: json['MyRate'] as int,
    isShow: json['isShow'] as bool,
    pintsForEachUser: json['PointsForEachUser'] as int,
    follow: json['follow'] as bool,
    images: (json['images'] as List<dynamic>)
        .map((e) => MediaModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    myQuestions: (json['myQusetion'] as List<dynamic>)
        .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$InvestmentAdsDetailsModelToJson(
        InvestmentAdsDetailsModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'advert_description': instance.advertDescription,
      'UserId': instance.userId,
      'type': instance.type,
      'point': instance.point,
      'count_view': instance.countView,
      'time': instance.time,
      'MyRate': instance.myRate,
      'isShow': instance.isShow,
      'PointsForEachUser': instance.pintsForEachUser,
      'follow': instance.follow,
      'images': instance.images,
      'myQusetion': instance.myQuestions,
    };
