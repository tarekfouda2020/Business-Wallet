import 'package:json_annotation/json_annotation.dart';

part 'MessageModel.g.dart';

@JsonSerializable(nullable: true)
class MessageModel {

  final String? text;
  final String? date;
  @JsonKey(name: "SenderId")
  final String senderId;

  MessageModel({ this.text, this.date,  required this.senderId});


  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}