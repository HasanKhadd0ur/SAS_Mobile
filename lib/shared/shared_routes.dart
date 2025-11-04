import 'package:flutter/material.dart';
import 'package:sas_mobile/shared/screens/about.dart';
import 'package:sas_mobile/shared/screens/faq.dart';
import 'package:sas_mobile/core/navigation/app_route_info.dart';

class SharedRoutes {
  static const String about = '/about';
  static const String faq = '/faq';

  static Map<String, WidgetBuilder> routes = {
    about: (context) => const AboutScreen(),
    faq: (context) => const FaqScreen(),
  };

  static final List<AppRouteInfo> routeInfos = [
    AppRouteInfo(path: about, title: 'About', icon: Icons.info_outline),
    AppRouteInfo(path: faq, title: 'FAQ', icon: Icons.help_outline),
  ];
}
