// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackagesModel _$PackagesModelFromJson(Map<String, dynamic> json) {
  return PackagesModel(
    type: json['type'] as int,
    title: json['title'] as String,
    decription: json['decription'] as String,
    Content:
        (json['Content'] as List<dynamic>).map((e) => e as String).toList(),
    start: json['start'] as String,
    data: json['data'] as String,
    price: json['price'] as int,
  );
}

Map<String, dynamic> _$PackagesModelToJson(PackagesModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'decription': instance.decription,
      'Content': instance.Content,
      'start': instance.start,
      'data': instance.data,
      'price': instance.price,
    };
