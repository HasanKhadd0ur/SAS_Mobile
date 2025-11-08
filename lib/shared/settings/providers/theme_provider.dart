import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode { light, dark, system }

class ThemeNotifier extends Notifier<AppThemeMode> {
  static const String _themeKey = 'theme_mode';

  @override
  AppThemeMode build() {
    _loadTheme();
    return AppThemeMode.light;
  }

  void _loadTheme() {
    SharedPreferences.getInstance().then((prefs) {
      final themeIndex = prefs.getInt(_themeKey) ?? 0;
      state = AppThemeMode.values[themeIndex];
    });
  }

  Future<void> setTheme(AppThemeMode theme) async {
    state = theme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, theme.index);
  }
}

final themeProvider = NotifierProvider<ThemeNotifier, AppThemeMode>(() {
  return ThemeNotifier();
});

extension AppThemeModeExtension on AppThemeMode {
  ThemeMode get flutterThemeMode {
    switch (this) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  String get displayName {
    switch (this) {
      case AppThemeMode.light:
        return 'Light';
      case AppThemeMode.dark:
        return 'Dark';
      case AppThemeMode.system:
        return 'System';
    }
  }
}

