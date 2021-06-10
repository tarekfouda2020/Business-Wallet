// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_interests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyInterestsModel _$MyInterestsModelFromJson(Map<String, dynamic> json) {
  return MyInterestsModel(
    myInterests: (json['myInteristies'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    images: (json['Imgs'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$MyInterestsModelToJson(MyInterestsModel instance) =>
    <String, dynamic>{
      'myInteristies': instance.myInterests,
      'Imgs': instance.images,
    };
