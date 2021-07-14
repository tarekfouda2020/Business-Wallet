import 'package:base_flutter/company/models/comp_service_model.dart';
import 'package:base_flutter/company/models/dots/image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brochure_details_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class BrochureDetailsModel {
  @JsonKey(name: 'user_id')
  String userId;
  @JsonKey(name: 'business_id')
  int businessId;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'img')
  String img;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'details')
  String details;
  @JsonKey(name: 'file')
  String file;
  @JsonKey(name: 'fileName')
  String fileName;
  @JsonKey(name: 'fkkyan')
  String fkkyan;
  @JsonKey(name: 'name_service')
  String nameService;
  @JsonKey(name: 'name_product')
  String nameProduct;
  @JsonKey(nullable: true)
  List<CompServiceModel>? services;
  @JsonKey(nullable: true)
  List<ImageModel>? images;

  BrochureDetailsModel(
      {required this.userId,
      required this.businessId,
      required this.name,
      required this.img,
      required this.phone,
      required this.email,
      required this.details,
      required this.file,
      required this.fileName,
      required this.fkkyan,
      required this.nameService,
      required this.nameProduct,
      required this.services,
      required this.images});

  factory BrochureDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BrochureDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrochureDetailsModelToJson(this);
}
