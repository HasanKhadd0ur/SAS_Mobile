// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'SAS';

  @override
  String get mapView => 'Map View';

  @override
  String get dailyEvents => 'Daily Events';

  @override
  String get todaySummary => 'Today Summary';

  @override
  String get topics => 'Topics';

  @override
  String get about => 'About';

  @override
  String get faq => 'FAQ';

  @override
  String get settings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get chooseThemeMode => 'Choose your preferred theme mode';

  @override
  String get selectLanguage => 'Select your preferred language';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get useLightTheme => 'Use light theme';

  @override
  String get useDarkTheme => 'Use dark theme';

  @override
  String get followSystemSetting => 'Follow system setting';

  @override
  String get aboutScreenTitle => 'About SAS';

  @override
  String get aboutSasTitle => 'About SAS';

  @override
  String get aboutSasDescription =>
      'The Situation Awareness System (SAS) is a scalable, microservices-based platform designed to monitor and analyze daily and historical events on an interactive map. By combining social media data scraping, event detection, geolocation inference, and real-time visualization, SAS empowers decision-makers and individuals to stay informed and aware of unfolding situations.';

  @override
  String get ourMission => 'Our Mission';

  @override
  String get missionDescription =>
      'Our mission is to deliver accurate, timely, and actionable information by leveraging artificial intelligence and deep learning. SAS enhances situational awareness, supports community resilience, and promotes informed decision-making in a rapidly evolving world.';

  @override
  String get stayAwareTagline => 'Stay aware. Stay informed.';

  @override
  String get faqQuestion1 => 'Why SAS?';

  @override
  String get faqAnswer1 =>
      'Social media has become a primary source of real-time information. SAS leverages this by continuously scraping and analyzing data from platforms like Telegram and Twitter to identify events as they unfold.';

  @override
  String get faqQuestion2 => 'What is SAS?';

  @override
  String get faqAnswer2 =>
      'SAS (Situational Awareness System) is a scalable platform that monitors, detects, and visualizes events using social media data with AI-powered crawlers.';

  @override
  String get faqQuestion3 => 'How does SAS detect events?';

  @override
  String get faqAnswer3 =>
      'SAS leverages deep learning models, natural language processing, and clustering techniques to identify emerging events and determine their geographic locations.';

  @override
  String get faqQuestion4 => 'Who can use SAS?';

  @override
  String get faqAnswer4 =>
      'SAS is designed for both the public and decision-makers. General users can explore events, while authorized monitors and analysts can update and verify event details.';

  @override
  String get faqQuestion5 => 'Is SAS free to use?';

  @override
  String get faqAnswer5 =>
      'Basic access to the daily event map is open for everyone. Advanced features such as historical data, analytics, and personalized alerts require an account.';
}
