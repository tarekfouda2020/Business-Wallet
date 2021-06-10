import 'package:json_annotation/json_annotation.dart';

part 'follower_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class FollowerModel {
  @JsonKey(name: 'Id')
  String id;
  @JsonKey(name: 'Name')
  String name;
  @JsonKey(name: 'Background')
  String background;
  @JsonKey(name: 'Img')
  String img;
  @JsonKey(name: 'Rate')
  double rate;
  @JsonKey(name: 'Count')
  int count;
  @JsonKey(name: 'NumberEdit')
  int numberEdit;

  FollowerModel(
      {
       required this.id,
        required    this.name,
        required  this.background,
        required  this.img,
        required  this.rate,
        required  this.count,
        required  this.numberEdit});

  factory FollowerModel.fromJson(Map<String, dynamic> json) =>
      _$FollowerModelFromJson(json);

  Map<String, dynamic> toJson() => _$FollowerModelToJson(this);
}
