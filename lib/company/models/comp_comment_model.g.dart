// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompCommentModel _$CompCommentModelFromJson(Map<String, dynamic> json) {
  return CompCommentModel(
    commentId: json['comment_id'] as int?,
    text: json['text'] as String?,
    rate: json['rate'] as int?,
    ownerImg: json['owner_img'] as String?,
    commentImg: json['comment_img'] as String?,
    ownerName: json['owner_name'] as String?,
    date: json['date'] as String?,
    fkOwnerComment: json['fk_owner_comment'] as String?,
  );
}

Map<String, dynamic> _$CompCommentModelToJson(CompCommentModel instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
      'text': instance.text,
      'rate': instance.rate,
      'owner_img': instance.ownerImg,
      'comment_img': instance.commentImg,
      'owner_name': instance.ownerName,
      'date': instance.date,
      'fk_owner_comment': instance.fkOwnerComment,
    };
