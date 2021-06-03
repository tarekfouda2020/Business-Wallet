// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel(
    commentId: json['Comment_Id'] as int,
    text: json['Text'] as String,
    rate: json['Rate'] as int,
    Type_user: json['Type_user'] as bool,
    ownerImg: json['Owner_Img'] as String,
    ownerId: json['Owner_Id'] as String,
    commentImg: json['Comment_Img'] as String,
    ownerName: json['Owner_Name'] as String,
    time: json['time'] as String,
    date: json['date'] as String,
    typeUser: json['typeUser'] as int,
  );
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'Comment_Id': instance.commentId,
      'Text': instance.text,
      'Rate': instance.rate,
      'Type_user': instance.Type_user,
      'Owner_Img': instance.ownerImg,
      'Owner_Id': instance.ownerId,
      'Comment_Img': instance.commentImg,
      'Owner_Name': instance.ownerName,
      'time': instance.time,
      'date': instance.date,
      'typeUser': instance.typeUser,
    };
