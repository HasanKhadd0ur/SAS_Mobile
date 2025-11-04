import 'package:flutter/material.dart';
import 'package:sas_mobile/features/events/data/event_repository.dart';
import 'package:sas_mobile/features/events/presentation/screens/daily_events_screen.dart';
import 'package:sas_mobile/features/events/presentation/screens/map_view_screen.dart';
import 'package:sas_mobile/features/events/presentation/screens/today_summary_screen.dart';
import 'package:sas_mobile/core/navigation/app_route_info.dart';

class EventsRoutes {
  static const String dailyEvents = '/events/daily';
  static const String mapView = '/events/map';
  static const String todaySummary = '/events/today-summary';

  static Map<String, WidgetBuilder> routes(EventRepository repo) => {
        dailyEvents: (context) => DailyEventsScreen(eventRepository: repo),
        mapView: (context) => MapViewScreen(eventRepository: repo),
        todaySummary: (context) => TodaySummaryScreen(eventRepository: repo),
      };

  static final List<AppRouteInfo> routeInfos = [
    AppRouteInfo(path: mapView, title: 'Map View', icon: Icons.map),
    AppRouteInfo(path: dailyEvents, title: 'Daily Events', icon: Icons.event_note),
    AppRouteInfo(path: todaySummary, title: 'Today Summary', icon: Icons.summarize),
  ];
}
