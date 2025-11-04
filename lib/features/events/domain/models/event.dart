import 'package:json_annotation/json_annotation.dart';
part 'event.g.dart';

@JsonSerializable(explicitToJson: true)
class Event {
  final String id;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;
  final String domainId;
  final EventInfo eventInfo;
  final Topic topic;
  final Location location;
  final bool isReviewed;

  Event({
    required this.id,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.domainId,
    required this.eventInfo,
    required this.topic,
    required this.location,
    required this.isReviewed,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class EventInfo {
  final String title;
  final String summary;
  final double sentimentScore;
  final String sentimentLabel;

  EventInfo({
    required this.title,
    required this.summary,
    required this.sentimentScore,
    required this.sentimentLabel,
  });

  factory EventInfo.fromJson(Map<String, dynamic> json) => _$EventInfoFromJson(json);
  Map<String, dynamic> toJson() => _$EventInfoToJson(this);
}

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

@JsonSerializable()
class Location {
  final double latitude;
  final double longitude;
  final String? regionName;
  final String? city;
  final String? country;

  Location({
    required this.city, 
    required this.country, 
    required this.latitude,
    required this.longitude,
    this.regionName,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
