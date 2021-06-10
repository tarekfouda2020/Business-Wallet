import 'package:json_annotation/json_annotation.dart';

part 'favorite_details_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class FavoriteDetailsModel {
  @JsonKey(name: 'id_kayan')
  int idKayan;
  @JsonKey(name: 'name_kayan')
  String nameKayan;
  @JsonKey(name: 'email_kayan')
  String emailKayan;
  @JsonKey(name: 'phone_kayan')
  String phoneKayan;
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'lng')
  String lng;
  @JsonKey(name: 'background')
  String background;
  @JsonKey(name: 'img_kayan')
  String imgKayan;
  @JsonKey(name: 'Fk_User')
  String fkUser;
  @JsonKey(name: 'MainField')
  String mainField;

  FavoriteDetailsModel(
      {required this.idKayan,
      required this.nameKayan,
      required this.emailKayan,
      required this.phoneKayan,
      required this.lat,
      required this.lng,
      required this.background,
      required this.imgKayan,
      required this.fkUser,
      required this.mainField});

  factory FavoriteDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteDetailsModelToJson(this);
}
