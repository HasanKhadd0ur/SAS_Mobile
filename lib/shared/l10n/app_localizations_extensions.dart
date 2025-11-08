import 'app_localizations.dart';
import '../models/faq_item.dart';

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

  /// Returns a list of FAQ items with localized questions and answers.
  /// This method directly accesses localization getters without using switch statements.
  List<FaqItem> getFaqItems() {
    return [
      FaqItem(question: faqQuestion1, answer: faqAnswer1),
      FaqItem(question: faqQuestion2, answer: faqAnswer2),
      FaqItem(question: faqQuestion3, answer: faqAnswer3),
      FaqItem(question: faqQuestion4, answer: faqAnswer4),
      FaqItem(question: faqQuestion5, answer: faqAnswer5),
    ];
  }
}

