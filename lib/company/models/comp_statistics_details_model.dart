import 'package:base_flutter/company/models/comp_statistics_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comp_statistics_details_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CompStatisticsDetailsModel {
  @JsonKey(name: 'Statistics')
  List<CompStatisticsModel> statistics;
  @JsonKey(name: 'count_view')
  int countView;
  @JsonKey(name: 'count_share_out')
  int countShareOut;
  @JsonKey(name: 'count_share')
  int countShare;
  @JsonKey(name: 'countFollow')
  int countFollow;

  CompStatisticsDetailsModel(
      {required this.statistics,
      required this.countView,
      required this.countShareOut,
      required this.countShare,
      required this.countFollow});

  factory CompStatisticsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CompStatisticsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompStatisticsDetailsModelToJson(this);
}
