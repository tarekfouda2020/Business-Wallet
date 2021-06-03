import 'package:base_flutter/company/models/comp_comment_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_image_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable(nullable: true)
class CompanyModel {
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "background")
  String? background;
  @JsonKey(name: "img")
  String? img;
  @JsonKey(name: "user_name")
  String? userName;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "kayan_name")
  String? kayanName;
  @JsonKey(name: "email_kayan")
  String? emailKayan;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "lat")
  String? lat;
  @JsonKey(name: "lng")
  String? lng;
  @JsonKey(name: "show_description")
  bool? showDescription;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "show_classifications")
  bool? showClassifications;
  @JsonKey(name: "show_branch")
  bool? showBranch;
  @JsonKey(name: "show_pdf_kayan")
  bool? showPdfKayan;
  @JsonKey(name: "show_partners_kayan")
  bool? showPartnersKayan;
  @JsonKey(name: "show_Accreditation_kayan")
  bool? showAccreditationKayan;
  @JsonKey(name: "fk_country")
  int? fkCountry;
  @JsonKey(name: "fk_city")
  int? fkCity;
  @JsonKey(name: "pare_code_Img")
  String? barcodeImg;
  @JsonKey(name: "pare_code")
  String? barcode;
  @JsonKey(name: "interests")
  List<DropDownModel>? interests;
  @JsonKey(name: "branch_Kayans")
  List<DropDownImageModel>? branchKayans;
  @JsonKey(name: "whats")
  String? whats;
  @JsonKey(name: "instgram")
  String? instgram;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "twitter")
  String? twitter;
  @JsonKey(name: "facebook")
  String? facebook;
  @JsonKey(name: "google")
  String? google;
  @JsonKey(name: "show_img_kayan")
  bool? showImgKayan;
  @JsonKey(name: "img_kayan")
  List<DropDownImageModel>? imgkayan;
  @JsonKey(name: "accreditation_kayan")
  List<DropDownImageModel>? accreditationKayan;
  @JsonKey(name: "partners_kayan")
  List<DropDownImageModel>? partnersKayan;
  @JsonKey(name: "txt_img_kayan")
  String? txtImgKayan;
  @JsonKey(name: "txt_pdf_kayan")
  String? txtPdfKayan;
  @JsonKey(name: "pdf_kayan")
  String? pdfKayan;
  @JsonKey(name: "website")
  String? website;
  @JsonKey(name: "comment_kayan")
  List<CompCommentModel>? commentKayan;
  @JsonKey(name: "count_like")
  int? countLike;
  @JsonKey(name: "rate")
  int? rate;
  @JsonKey(name: "county_name")
  String? countyName;
  @JsonKey(name: "city_name")
  String? cityName;
  @JsonKey(name: "phone_kayan")
  String? phoneKayan;

  @JsonKey(name: "CountLike")
  int? CountLike;
  @JsonKey(name: "CountRate")
  int? CountRate;
  @JsonKey(name: "Rate")
  int? Rate;

  CompanyModel(
      {required this.userId,
      this.background,
      this.img,
      this.userName,
      this.phone,
      this.email,
      this.kayanName,
      this.emailKayan,
      this.address,
      this.lat,
      this.lng,
      this.showDescription,
      this.description,
      this.showClassifications,
      this.showBranch,
      this.showPdfKayan,
      this.showPartnersKayan,
      this.showAccreditationKayan,
      this.fkCountry,
      this.fkCity,
      this.barcodeImg,
      this.barcode,
      this.interests,
      this.branchKayans,
      this.whats,
      this.instgram,
      this.code,
      this.twitter,
      this.facebook,
      this.google,
      this.showImgKayan,
      this.imgkayan,
      this.accreditationKayan,
      this.partnersKayan,
      this.txtImgKayan,
      this.txtPdfKayan,
      this.pdfKayan,
      this.website,
      this.commentKayan,
      this.countLike,
      this.rate,
      this.countyName,
      this.cityName,
      this.phoneKayan,
      this.CountLike,
      this.CountRate,
      this.Rate});

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
