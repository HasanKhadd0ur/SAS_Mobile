import 'package:flutter/material.dart';

class SupportedLocales {
  static const supported = [
    Locale('en'),
    Locale('ar'),
  ];

  static const fallback = Locale('en');
  
  static String getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية'; // Arabic
      default:
        return 'English';
    }
  }

  static String getLanguageCode(Locale locale) {
    return locale.languageCode.toUpperCase();
  }

}
