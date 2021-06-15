import 'package:json_annotation/json_annotation.dart';

part 'auto_search_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class AutoSearchModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'FieldId')
  int fieldId;
  @JsonKey(name: 'img')
  String img;
  @JsonKey(name: 'bac')
  String bac;

  AutoSearchModel({
    required this.id,
    required this.name,
    required this.fieldId,
    required this.img,
    required this.bac,
  });

  factory AutoSearchModel.fromJson(Map<String, dynamic> json) =>
      _$AutoSearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$AutoSearchModelToJson(this);
}
