import 'package:flutter/material.dart';
import 'package:sas_mobile/features/events/data/event_repository.dart';
import 'package:sas_mobile/features/events/presentation/screens/daily_events_screen.dart';
import 'package:sas_mobile/features/events/presentation/screens/map_view_screen.dart';
class EventsRoutes {
  static const String dailyEvents = '/events/daily';
  static const String mapView = '/events/map';

  static Map<String, WidgetBuilder> routes(EventRepository repo) {
    return {
      dailyEvents: (context) => DailyEventsScreen(eventRepository: repo),
      mapView: (context) => MapViewScreen(eventRepository: repo),
    };
  }
}
