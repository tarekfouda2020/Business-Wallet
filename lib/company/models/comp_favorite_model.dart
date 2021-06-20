import 'package:json_annotation/json_annotation.dart';

part 'comp_favorite_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CompFavoriteModel {
  @JsonKey(name: 'ID')
  int id;
  @JsonKey(name: 'IsShowWhenSend')
  int isShowWhenSend;
  @JsonKey(name: 'idSendCard')
  int idSendCard;
  @JsonKey(name: 'img')
  String img;
  @JsonKey(name: 'imgkayan')
  String imgkayan;
  @JsonKey(name: 'kayanname')
  String kayanName;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'kayan_id')
  String kayanId;
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'lng')
  String lng;
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'type')
  int type;

  CompFavoriteModel(
      {required this.id,
      required this.isShowWhenSend,
      required this.idSendCard,
      required this.img,
      required this.imgkayan,
      required this.kayanName,
      required this.phone,
      required this.kayanId,
      required this.lat,
      required this.lng,
      required this.address,
      required this.type});

  factory CompFavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$CompFavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompFavoriteModelToJson(this);
}
