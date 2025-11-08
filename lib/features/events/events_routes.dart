import 'package:flutter/material.dart';
import 'package:sas_mobile/core/navigation/app_route_info.dart';
import 'package:sas_mobile/features/events/data/event_repository.dart';
import 'package:sas_mobile/features/events/presentation/screens/daily_events_screen.dart';
import 'package:sas_mobile/features/events/presentation/screens/map_view_screen.dart';
import 'package:sas_mobile/features/events/presentation/screens/today_summary_screen.dart';
import 'package:sas_mobile/features/events/presentation/screens/events_by_topic_screen.dart';

class EventsRoutes {
  static const String dailyEvents = '/events/daily';
  static const String mapView = '/events/map';
  static const String todaySummary = '/events/today-summary';
  static const String eventsByTopic = '/events/by-topic';

  static Map<String, WidgetBuilder> routes(EventRepository repo) => {
        dailyEvents: (context) => DailyEventsScreen(eventRepository: repo),
        mapView: (context) => MapViewScreen(eventRepository: repo),
        todaySummary: (context) => TodaySummaryScreen(eventRepository: repo),

        eventsByTopic: (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>?;

          final topicId = args?['topicId'] as String? ?? '';
          final topicName = args?['topicName'] as String? ?? 'Unknown Topic';

          return EventsByTopicScreen(
            eventRepository: repo,
            topicId: topicId,
            topicName: topicName,
          );
        },
      };

  static final List<AppRouteInfo> routeInfos = [
    AppRouteInfo(path: mapView, titleKey: 'mapView', icon: Icons.map),
    AppRouteInfo(path: dailyEvents, titleKey: 'dailyEvents', icon: Icons.event_note),
    AppRouteInfo(path: todaySummary, titleKey: 'todaySummary', icon: Icons.summarize),
  ];
}
