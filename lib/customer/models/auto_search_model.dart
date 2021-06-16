import 'package:json_annotation/json_annotation.dart';

part 'auto_search_model.g.dart';

@JsonSerializable()
class AutoSearchModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'FieldId')
  int fieldId;

  AutoSearchModel({
    required this.id,
    required this.name,
    required this.fieldId,
  });

  factory AutoSearchModel.fromJson(Map<String, dynamic> json) =>
      _$AutoSearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$AutoSearchModelToJson(this);

  @override
  String toString() {
    return name;
  }
}
