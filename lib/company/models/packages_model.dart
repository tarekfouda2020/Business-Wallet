import 'package:json_annotation/json_annotation.dart';

part 'packages_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class PackagesModel {
  @JsonKey(name: 'type')
  int type;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'decription')
  String desc;
  @JsonKey(name: 'Content')
  List<String> content;
  @JsonKey(name: 'start')
  String start;
  @JsonKey(name: 'data')
  String data;
  @JsonKey(name: 'price')
  int price;

  PackagesModel(
      {required this.type,
      required this.title,
      required this.desc,
      required this.content,
      required this.start,
      required this.data,
      required this.price});

  factory PackagesModel.fromJson(Map<String, dynamic> json) =>
      _$PackagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackagesModelToJson(this);
}
