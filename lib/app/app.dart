import 'package:flutter/material.dart';
import 'package:sas_mobile/core/config/config.dart';
import 'package:sas_mobile/features/events/events_routes.dart';
import 'package:sas_mobile/features/topics/data/topic_api.dart';
import 'package:sas_mobile/features/topics/data/topic_repository.dart';
import 'package:sas_mobile/features/topics/topics_routes.dart';
import 'package:sas_mobile/shared/screens/splash_screen.dart';
import 'package:sas_mobile/shared/shared_routes.dart';
import '../core/theme/app_theme.dart';
import '../core/network/dio_client.dart';
import '../features/events/data/event_api.dart';
import '../features/events/data/event_repository.dart';


class SasApp extends StatelessWidget {
  const SasApp({super.key});

  @override
  Widget build(BuildContext context) {
    // init network client
    final eventDioClient = DioClient(baseUrl: Config.eventsServiceApiBaseUrl,);
    final topicDioClient = DioClient(baseUrl: Config.eventsServiceApiBaseUrl,);

    // apis and repositories
    final eventApi = EventApi(eventDioClient);
    final eventRepo = EventRepository(eventApi);

    final topicApi = TopicApi(topicDioClient);
    final topicRepo = TopicRepository(topicApi);
    

    return MaterialApp(
      title: 'SAS',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(eventRepository: eventRepo,topicRepository: topicRepo,),
        ...EventsRoutes.routes(eventRepo),
        ...SharedRoutes.routes,
        ...TopicsRoutes.routes(topicRepo),

      },    
    );
  }
}
