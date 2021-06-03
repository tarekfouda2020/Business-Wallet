// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainDetailsModel _$MainDetailsModelFromJson(Map<String, dynamic> json) {
  return MainDetailsModel(
    comments: (json['comments'] as List<dynamic>?)
        ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    details: json['Kayan'] == null
        ? null
        : DetailsModel.fromJson(json['Kayan'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MainDetailsModelToJson(MainDetailsModel instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'Kayan': instance.details,
    };
