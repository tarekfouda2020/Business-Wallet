import 'package:json_annotation/json_annotation.dart';

part 'conversation_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ConversationModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'user_name')
  String userName;
  @JsonKey(name: 'img')
  String img;
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'count')
  int count;
  @JsonKey(name: 'lastmsg')
  String lastMsg;
  @JsonKey(name: 'address')
  String address;

  ConversationModel(
      {
       required this.id,
        required    this.userName,
        required  this.img,
        required  this.date,
        required  this.count,
        required  this.lastMsg,
        required    this.address});

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationModelToJson(this);
}
