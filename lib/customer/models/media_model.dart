import 'package:json_annotation/json_annotation.dart';

part 'media_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class MediaModel {
  @JsonKey(name: 'file')
  String file;
  @JsonKey(name: 'type')
  int type;

  MediaModel({required this.file, required this.type});

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaModelToJson(this);
}
