import 'package:json_annotation/json_annotation.dart';

part 'field_drop_down_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class FieldDropDownModel {
  @JsonKey(name: 'Field_Id')
  int? fieldId;
  @JsonKey(name: 'FieldName')
  String? name;

  FieldDropDownModel({this.fieldId, this.name});

  factory FieldDropDownModel.fromJson(Map<String, dynamic> json) =>
      _$FieldDropDownModelFromJson(json);

  Map<String, dynamic> toJson() => _$FieldDropDownModelToJson(this);
}
