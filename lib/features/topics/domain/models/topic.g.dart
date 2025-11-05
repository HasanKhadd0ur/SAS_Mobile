// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Topic _$TopicFromJson(Map<String, dynamic> json) => Topic(
  id: json['id'] as String,
  name: json['name'] as String,
  iconUrl: json['iconUrl'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'iconUrl': instance.iconUrl,
  'description': instance.description,
};
