import 'package:flutter/material.dart';
import 'package:sas_mobile/shared/screens/about.dart';
import 'package:sas_mobile/shared/screens/faq.dart';

class SharedRoutes {
  static const String about = '/about';
  static const String faq = '/faq';

  static Map<String, WidgetBuilder> routes = {
    about: (context) => const AboutScreen(),
    faq: (context) => const FaqScreen(),
  };
}
