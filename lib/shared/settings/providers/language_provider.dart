import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageNotifier extends Notifier<Locale> {
  static const String _languageKey = 'language_code';

  @override
  Locale build() {
    _loadLanguage();
    return const Locale('en');
  }

  void _loadLanguage() {
    SharedPreferences.getInstance().then((prefs) {
      final languageCode = prefs.getString(_languageKey) ?? 'en';
      state = Locale(languageCode);
    });
  }

  Future<void> setLanguage(Locale locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, locale.languageCode);
  }
}

final languageProvider = NotifierProvider<LanguageNotifier, Locale>(() {
  return LanguageNotifier();
});

// Supported languages
class AppLanguages {
  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('ar'), // Arabic
  ];

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

