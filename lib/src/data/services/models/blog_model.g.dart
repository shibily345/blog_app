// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlogImpl _$$BlogImplFromJson(Map<String, dynamic> json) => _$BlogImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      imageURL: json['imageURL'] as String,
      summary: json['summary'] as String,
      content: json['content'] as String,
      deeplink: json['deeplink'] as String,
    );

Map<String, dynamic> _$$BlogImplToJson(_$BlogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageURL': instance.imageURL,
      'summary': instance.summary,
      'content': instance.content,
      'deeplink': instance.deeplink,
    };
