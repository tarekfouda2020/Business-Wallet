// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_statistics_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompStatisticsDetailsModel _$CompStatisticsDetailsModelFromJson(
    Map<String, dynamic> json) {
  return CompStatisticsDetailsModel(
    statistics: (json['Statistics'] as List<dynamic>)
        .map((e) => CompStatisticsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    countView: json['count_view'] as int,
    countShareOut: json['count_share_out'] as int,
    countShare: json['count_share'] as int,
    countFollow: json['countFollow'] as int,
  );
}

Map<String, dynamic> _$CompStatisticsDetailsModelToJson(
        CompStatisticsDetailsModel instance) =>
    <String, dynamic>{
      'Statistics': instance.statistics,
      'count_view': instance.countView,
      'count_share_out': instance.countShareOut,
      'count_share': instance.countShare,
      'countFollow': instance.countFollow,
    };
