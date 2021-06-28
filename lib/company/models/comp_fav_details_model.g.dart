// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_fav_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompFavDetailsModel _$CompFavDetailsModelFromJson(Map<String, dynamic> json) {
  return CompFavDetailsModel(
    id: json['Id'] as String,
    idSendCard: json['idSendCard'] as int,
    businessId: json['BusinessId'] as int,
    name: json['Name'] as String,
    img: json['Img'] as String,
    phone: json['Phone'] as String,
    email: json['Email'] as String,
    details: json['Details'] as String,
    file: json['File'] as String,
    fileName: json['FileName'] as String,
    fk_kayan: json['fkkyan'] as String,
    services: (json['Services'] as List<dynamic>)
        .map((e) => CompServiceModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    images: (json['Images'] as List<dynamic>)
        .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    type: json['type'] as int,
    point: json['point'] as int,
    countView: json['count_view'] as int,
    isShowWhenSend: json['IsShowWhenSend'] as int,
    isShowWhenSendCheck: json['IsShowWhenSendCheck'] as bool,
    isShow: json['isShow'] as bool,
    isOwner: json['isOwner'] as bool,
    pointsForEachUser: json['PointsForEachUser'] as int,
    nameService: json['name_service'] as String,
    nameProduct: json['name_product'] as String,
    nameFile: json['name_file'] as String,
    wishDB: json['WishDB'] as bool,
    followDB: json['followDB'] as bool,
    flag: json['flag'] as bool,
  );
}

Map<String, dynamic> _$CompFavDetailsModelToJson(
        CompFavDetailsModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'idSendCard': instance.idSendCard,
      'BusinessId': instance.businessId,
      'Name': instance.name,
      'Img': instance.img,
      'Phone': instance.phone,
      'Email': instance.email,
      'Details': instance.details,
      'File': instance.file,
      'FileName': instance.fileName,
      'fkkyan': instance.fk_kayan,
      'Services': instance.services,
      'Images': instance.images,
      'type': instance.type,
      'point': instance.point,
      'count_view': instance.countView,
      'IsShowWhenSend': instance.isShowWhenSend,
      'IsShowWhenSendCheck': instance.isShowWhenSendCheck,
      'isShow': instance.isShow,
      'isOwner': instance.isOwner,
      'PointsForEachUser': instance.pointsForEachUser,
      'name_service': instance.nameService,
      'name_product': instance.nameProduct,
      'name_file': instance.nameFile,
      'WishDB': instance.wishDB,
      'followDB': instance.followDB,
      'flag': instance.flag,
    };
