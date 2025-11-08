import 'app_localizations.dart';

/// Extension on AppLocalizations to provide dynamic key-based lookup
extension AppLocalizationsExtensions on AppLocalizations {
  /// Returns the localized string for the given [key].
  /// Returns the key itself if no translation is found.
  String getByKey(String key) {
    // Map of localization keys to their corresponding getter functions
    final translations = <String, String Function(AppLocalizations)>{
      'mapView': (l10n) => l10n.mapView,
      'dailyEvents': (l10n) => l10n.dailyEvents,
      'todaySummary': (l10n) => l10n.todaySummary,
      'topics': (l10n) => l10n.topics,
      'about': (l10n) => l10n.about,
      'faq': (l10n) => l10n.faq,
      'settings': (l10n) => l10n.settings,
      // Add more keys here as new routes are added
    };

    final getter = translations[key];
    return getter?.call(this) ?? key;
  }
}

