import 'package:sas_mobile/core/config/environment.dart';

class Config {

  static String get eventsServiceApiBaseUrl {
    return '${Environment.baseUrl}/events/api/';
  }
  
  static String get identityServiceApiBaseUrl {
    return '${Environment.baseUrl}/identity/api/';
  }
  
}