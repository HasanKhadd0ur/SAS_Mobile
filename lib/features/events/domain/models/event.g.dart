// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
  domainId: json['domainId'] as String,
  eventInfo: EventInfo.fromJson(json['eventInfo'] as Map<String, dynamic>),
  topic: Topic.fromJson(json['topic'] as Map<String, dynamic>),
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  isReviewed: json['isReviewed'] as bool,
);

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'lastUpdatedAt': instance.lastUpdatedAt.toIso8601String(),
  'domainId': instance.domainId,
  'eventInfo': instance.eventInfo.toJson(),
  'topic': instance.topic.toJson(),
  'location': instance.location.toJson(),
  'isReviewed': instance.isReviewed,
};

EventInfo _$EventInfoFromJson(Map<String, dynamic> json) => EventInfo(
  title: json['title'] as String,
  summary: json['summary'] as String,
  sentimentScore: (json['sentimentScore'] as num).toDouble(),
  sentimentLabel: json['sentimentLabel'] as String,
);

Map<String, dynamic> _$EventInfoToJson(EventInfo instance) => <String, dynamic>{
  'title': instance.title,
  'summary': instance.summary,
  'sentimentScore': instance.sentimentScore,
  'sentimentLabel': instance.sentimentLabel,
};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  city: json['city'] as String?,
  country: json['country'] as String?,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  regionName: json['regionName'] as String?,
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'regionName': instance.regionName,
  'city': instance.city,
  'country': instance.country,
};
