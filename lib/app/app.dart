import 'package:flutter/material.dart';
import 'package:sas_mobile/core/config/config.dart';
import 'package:sas_mobile/shared/screens/about.dart';
import 'package:sas_mobile/shared/screens/faq.dart';
import 'package:sas_mobile/shared/screens/splash_screen.dart';
import '../core/theme/app_theme.dart';
import '../features/events/presentation/screens/daily_events_screen.dart';
import '../core/network/dio_client.dart';
import '../features/events/data/event_api.dart';
import '../features/events/data/event_repository.dart';


class SasApp extends StatelessWidget {
  const SasApp({super.key});

  @override
  Widget build(BuildContext context) {
    // init network client
    final eventDioClient = DioClient(baseUrl: Config.eventsServiceApiBaseUrl);

    // apis and repositories
    final eventApi = EventApi(eventDioClient);
    final eventRepo = EventRepository(eventApi);

    return MaterialApp(
      title: 'SAS',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(eventRepository: eventRepo),
        '/home': (context) => DailyEventsScreen(eventRepository: eventRepo),
        '/about': (context) => AboutScreen(),
        '/faq': (context) => FaqScreen(),
      },
    );
  }
}
