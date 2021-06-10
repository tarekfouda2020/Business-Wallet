// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsDetailsModel _$AdsDetailsModelFromJson(Map<String, dynamic> json) {
  return AdsDetailsModel(
    typeFile: json['type_file'] as String,
    nameAds: json['name_ads'] as String,
    userId: json['UserId'] as String,
    address: json['address'] as String,
    countView: json['count_view'] as int,
    countRate: json['count_rate'] as int,
    sumRate: json['sum_rate'] as int,
    countLike: json['count_like'] as int,
    like: json['like'] as bool,
    follow: json['follow'] as bool,
    wish: json['wish'] as bool,
    myRate: json['MyRate'] as int,
    advertDescription: json['advert_description'] as String,
    interests: json['interests'] as bool,
    catalog: json['catalog'] as String,
    id: json['Id'] as int,
    point: json['point'] as int,
    type: json['type'] as int,
    time: json['time'] as int,
    isShow: json['isShow'] as bool,
    isOwner: json['isOwner'] as bool,
    pointsForEachUser: json['PointsForEachUser'] as int,
    rateAds: json['RateAds'] as int,
    visitCount: json['vistCount'] as int,
    adsFile: json['ads_file'] as String,
    adsText: json['ads_text'] as String,
    business: json['business'] as bool,
    comments: (json['getCommentsKayanViewModels'] as List<dynamic>)
        .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    media: (json['media'] as List<dynamic>)
        .map((e) => MediaModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AdsDetailsModelToJson(AdsDetailsModel instance) =>
    <String, dynamic>{
      'type_file': instance.typeFile,
      'name_ads': instance.nameAds,
      'UserId': instance.userId,
      'address': instance.address,
      'count_view': instance.countView,
      'count_rate': instance.countRate,
      'sum_rate': instance.sumRate,
      'count_like': instance.countLike,
      'like': instance.like,
      'follow': instance.follow,
      'wish': instance.wish,
      'MyRate': instance.myRate,
      'advert_description': instance.advertDescription,
      'interests': instance.interests,
      'catalog': instance.catalog,
      'media': instance.media,
      'Id': instance.id,
      'point': instance.point,
      'type': instance.type,
      'time': instance.time,
      'isShow': instance.isShow,
      'isOwner': instance.isOwner,
      'PointsForEachUser': instance.pointsForEachUser,
      'RateAds': instance.rateAds,
      'vistCount': instance.visitCount,
      'ads_file': instance.adsFile,
      'ads_text': instance.adsText,
      'business': instance.business,
      'getCommentsKayanViewModels': instance.comments,
    };
