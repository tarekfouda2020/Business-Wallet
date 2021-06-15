// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialModel _$SocialModelFromJson(Map<String, dynamic> json) {
  return SocialModel(
    facebook: json['facebook'] as String,
    instgram: json['instgram'] as String,
    twitter: json['twitter'] as String,
    whatsup: json['whatsup'] as String,
  );
}

Map<String, dynamic> _$SocialModelToJson(SocialModel instance) =>
    <String, dynamic>{
      'facebook': instance.facebook,
      'instgram': instance.instgram,
      'twitter': instance.twitter,
      'whatsup': instance.whatsup,
    };
