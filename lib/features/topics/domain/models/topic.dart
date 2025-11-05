import 'package:json_annotation/json_annotation.dart';
part 'topic.g.dart';

@JsonSerializable()
class Topic {
  final String id;
  final String name;
  final String iconUrl;
  final String description;

  Topic({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.description,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}
