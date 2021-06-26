// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompBranchModel _$CompBranchModelFromJson(Map<String, dynamic> json) {
  return CompBranchModel(
    id: json['id'] as int,
    fkKayan: json['fk_kayan'] as String,
    address: json['address'] as String,
    phone: json['phone'] as String,
    lat: json['lat'] as String,
    lng: json['lng'] as String,
    hourWork: json['hour_work'] as String,
    stutes: json['stutes'] as bool,
    hourWorkTo: json['hour_work_to'] as String,
    code: json['code'] as String,
    mainOrNo: json['main_or_no'] as bool,
  );
}

Map<String, dynamic> _$CompBranchModelToJson(CompBranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fk_kayan': instance.fkKayan,
      'address': instance.address,
      'phone': instance.phone,
      'lat': instance.lat,
      'lng': instance.lng,
      'hour_work': instance.hourWork,
      'stutes': instance.stutes,
      'hour_work_to': instance.hourWorkTo,
      'code': instance.code,
      'main_or_no': instance.mainOrNo,
    };
