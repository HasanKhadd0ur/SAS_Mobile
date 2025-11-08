import 'package:flutter/material.dart';
import 'package:sas_mobile/core/navigation/app_route_info.dart';
import 'package:sas_mobile/features/topics/domain/repositories/i_topic_repository.dart';
import 'package:sas_mobile/features/topics/presenation/screens/topics_screen.dart';

class TopicsRoutes {
  static const String topics = '/topics';
  
  static Map<String, WidgetBuilder> routes(ITopicRepository repo) => {
        topics: (context) => TopicsScreen(topicRepository: repo),
     };

  static final List<AppRouteInfo> routeInfos = [
    AppRouteInfo(path: topics, titleKey: 'topics', icon: Icons.topic),
  ];
}
