// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) {
  return ConversationModel(
    id: json['id'] as String,
    userName: json['user_name'] as String,
    img: json['img'] as String,
    date: json['date'] as String,
    count: json['count'] as int,
    lastMsg: json['lastmsg'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$ConversationModelToJson(ConversationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'img': instance.img,
      'date': instance.date,
      'count': instance.count,
      'lastmsg': instance.lastMsg,
      'address': instance.address,
    };
