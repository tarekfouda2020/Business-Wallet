import 'package:json_annotation/json_annotation.dart';

part 'kayan_owner_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class KayanOwnerModel {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'address_kayan')
  String addressKayan;
  @JsonKey(name: 'Id')
  String id;
  @JsonKey(name: 'Img')
  String image;
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'lng')
  String lng;

  KayanOwnerModel({
    required this.name,
    required this.addressKayan,
    required this.id,
    required this.image,
    required this.lat,
    required this.lng,
  });

  factory KayanOwnerModel.fromJson(Map<String, dynamic> json) =>
      _$KayanOwnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$KayanOwnerModelToJson(this);
}
