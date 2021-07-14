// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brochure_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrochureDetailsModel _$BrochureDetailsModelFromJson(Map<String, dynamic> json) {
  return BrochureDetailsModel(
    userId: json['user_id'] as String,
    businessId: json['business_id'] as int,
    name: json['name'] as String,
    img: json['img'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    details: json['details'] as String,
    file: json['file'] as String,
    fileName: json['fileName'] as String,
    fkkyan: json['fkkyan'] as String,
    nameService: json['name_service'] as String,
    nameProduct: json['name_product'] as String,
    services: (json['services'] as List<dynamic>?)
        ?.map((e) => CompServiceModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    images: (json['images'] as List<dynamic>?)
        ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BrochureDetailsModelToJson(
        BrochureDetailsModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'business_id': instance.businessId,
      'name': instance.name,
      'img': instance.img,
      'phone': instance.phone,
      'email': instance.email,
      'details': instance.details,
      'file': instance.file,
      'fileName': instance.fileName,
      'fkkyan': instance.fkkyan,
      'name_service': instance.nameService,
      'name_product': instance.nameProduct,
      'services': instance.services,
      'images': instance.images,
    };
