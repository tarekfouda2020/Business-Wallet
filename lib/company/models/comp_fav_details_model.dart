import 'package:base_flutter/company/models/comp_service_model.dart';
import 'package:base_flutter/company/models/dots/image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comp_fav_details_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CompFavDetailsModel {
  @JsonKey(name: 'Id')
  String id;
  @JsonKey(name: 'idSendCard')
  int idSendCard;
  @JsonKey(name: 'BusinessId')
  int businessId;
  @JsonKey(name: 'Name')
  String name;
  @JsonKey(name: 'Img')
  String img;
  @JsonKey(name: 'Phone')
  String phone;
  @JsonKey(name: 'Email')
  String email;
  @JsonKey(name: 'Details')
  String details;
  @JsonKey(name: 'File')
  String file;
  @JsonKey(name: 'FileName')
  String fileName;
  @JsonKey(name: 'fkkyan')
  String fk_kayan;

  @JsonKey(name: 'Services')
  List<CompServiceModel> services;
  @JsonKey(name: 'Images')
  List<ImageModel> images;
  @JsonKey(name: 'type')
  int type;
  @JsonKey(name: 'point')
  int point;
  @JsonKey(name: 'count_view')
  int countView;
  @JsonKey(name: 'IsShowWhenSend')
  int isShowWhenSend;
  @JsonKey(name: 'IsShowWhenSendCheck')
  bool isShowWhenSendCheck;
  @JsonKey(name: 'isShow')
  bool isShow;
  @JsonKey(name: 'PointsForEachUser')
  int pointsForEachUser;
  @JsonKey(name: 'name_service')
  String nameService;
  @JsonKey(name: 'name_product')
  String nameProduct;
  @JsonKey(name: 'name_file')
  String nameFile;
  @JsonKey(name: 'WishDB')
  bool wishDB;
  @JsonKey(name: 'followDB')
  bool followDB;
  @JsonKey(name: 'flag')
  bool flag;

  CompFavDetailsModel(
      {required this.id,
      required this.idSendCard,
      required this.businessId,
      required this.name,
      required this.img,
      required this.phone,
      required this.email,
      required this.details,
      required this.file,
      required this.fileName,
      required this.fk_kayan,
      required this.services,
      required this.images,
      required this.type,
      required this.point,
      required this.countView,
      required this.isShowWhenSend,
      required this.isShowWhenSendCheck,
      required this.isShow,
      required this.pointsForEachUser,
      required this.nameService,
      required this.nameProduct,
      required this.nameFile,
      required this.wishDB,
      required this.followDB,
      required this.flag});

  factory CompFavDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CompFavDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompFavDetailsModelToJson(this);
}
