// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_down_selected.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DropDownSelected _$DropDownSelectedFromJson(Map<String, dynamic> json) {
  return DropDownSelected(
    id: json['id'] as int,
    name: json['name'] as String,
    selected: json['selected'] as bool,
  );
}

Map<String, dynamic> _$DropDownSelectedToJson(DropDownSelected instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'selected': instance.selected,
    };
