import 'package:json_annotation/json_annotation.dart';

part 'comp_invitation_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CompInvitationModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'idSendCard')
  int idSendCard;
  @JsonKey(name: 'fk_city')
  int fkCity;
  @JsonKey(name: 'fk_intrest')
  int fkIntrest;
  @JsonKey(name: 'fk_kayan')
  String fkKayan;
  @JsonKey(name: 'num_point')
  double numPoint;
  @JsonKey(name: 'type')
  int type;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'categry')
  String category;
  @JsonKey(name: 'img')
  String img;
  @JsonKey(name: 'img_user')
  String imgUser;
  @JsonKey(name: 'rate')
  int rate;
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'lng')
  String lng;
  @JsonKey(name: 'show')
  bool show;
  @JsonKey(name: 'IsShowWhenSend')
  int isShowWhenSend;
  @JsonKey(name: 'business')
  bool business;

  CompInvitationModel(
      {required this.id,
      required this.idSendCard,
      required this.fkCity,
      required this.fkIntrest,
      required this.fkKayan,
      required this.numPoint,
      required this.type,
      required this.name,
      required this.category,
      required this.img,
      required this.imgUser,
      required this.rate,
      required this.date,
      required this.phone,
      required this.address,
      required this.lat,
      required this.lng,
      required this.show,
      required this.isShowWhenSend,
      required this.business});

  factory CompInvitationModel.fromJson(Map<String, dynamic> json) =>
      _$CompInvitationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompInvitationModelToJson(this);
}
