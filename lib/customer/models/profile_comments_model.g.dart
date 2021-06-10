// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileCommentsModel _$ProfileCommentsModelFromJson(Map<String, dynamic> json) {
  return ProfileCommentsModel(
    kayanId: json['kayanId'] as String,
    kayanName: json['kayanName'] as String,
    rate: json['rate'] as int,
    Img: json['Img'] as String,
    backgroundImg: json['backgroundImg'] as String,
    lat: json['lat'] as String,
    lng: json['lng'] as String,
    comment: json['comment'] as String,
    commentId: json['comment_id'] as int,
    commentImg: json['comment_img'] as String,
  );
}

Map<String, dynamic> _$ProfileCommentsModelToJson(
        ProfileCommentsModel instance) =>
    <String, dynamic>{
      'kayanId': instance.kayanId,
      'kayanName': instance.kayanName,
      'rate': instance.rate,
      'Img': instance.Img,
      'backgroundImg': instance.backgroundImg,
      'lat': instance.lat,
      'lng': instance.lng,
      'comment': instance.comment,
      'comment_id': instance.commentId,
      'comment_img': instance.commentImg,
    };
