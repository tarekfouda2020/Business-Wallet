import 'package:json_annotation/json_annotation.dart';

part 'comp_statistics_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CompStatisticsModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'type')
  int type;
  @JsonKey(name: 'date')
  String date;

  CompStatisticsModel(
      {required this.id,
      required this.name,
      required this.type,
      required this.date});

  factory CompStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$CompStatisticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompStatisticsModelToJson(this);
}
