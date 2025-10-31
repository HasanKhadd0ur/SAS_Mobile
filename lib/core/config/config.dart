import 'package:sas_mobile/core/config/environment.dart';

class Config {

  static String get eventsServiceApiBaseUrl {
    return '${Environment.baseUrl}/evets/api';
  }
}