import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// The application name
  ///
  /// In en, this message translates to:
  /// **'SAS'**
  String get appName;

  /// Map view menu item
  ///
  /// In en, this message translates to:
  /// **'Map View'**
  String get mapView;

  /// Daily events menu item
  ///
  /// In en, this message translates to:
  /// **'Daily Events'**
  String get dailyEvents;

  /// Today summary menu item
  ///
  /// In en, this message translates to:
  /// **'Today Summary'**
  String get todaySummary;

  /// Topics menu item
  ///
  /// In en, this message translates to:
  /// **'Topics'**
  String get topics;

  /// About menu item
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// FAQ menu item
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// Settings menu item
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Theme settings section title
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Language settings section title
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Theme selection description
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred theme mode'**
  String get chooseThemeMode;

  /// Language selection description
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language'**
  String get selectLanguage;

  /// Light theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// Dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// System theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// Light theme description
  ///
  /// In en, this message translates to:
  /// **'Use light theme'**
  String get useLightTheme;

  /// Dark theme description
  ///
  /// In en, this message translates to:
  /// **'Use dark theme'**
  String get useDarkTheme;

  /// System theme description
  ///
  /// In en, this message translates to:
  /// **'Follow system setting'**
  String get followSystemSetting;

  /// About screen title
  ///
  /// In en, this message translates to:
  /// **'About SAS'**
  String get aboutScreenTitle;

  /// About SAS section title
  ///
  /// In en, this message translates to:
  /// **'About SAS'**
  String get aboutSasTitle;

  /// About SAS description text
  ///
  /// In en, this message translates to:
  /// **'The Situation Awareness System (SAS) is a scalable, microservices-based platform designed to monitor and analyze daily and historical events on an interactive map. By combining social media data scraping, event detection, geolocation inference, and real-time visualization, SAS empowers decision-makers and individuals to stay informed and aware of unfolding situations.'**
  String get aboutSasDescription;

  /// Our Mission section title
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get ourMission;

  /// Mission description text
  ///
  /// In en, this message translates to:
  /// **'Our mission is to deliver accurate, timely, and actionable information by leveraging artificial intelligence and deep learning. SAS enhances situational awareness, supports community resilience, and promotes informed decision-making in a rapidly evolving world.'**
  String get missionDescription;

  /// Stay aware tagline
  ///
  /// In en, this message translates to:
  /// **'Stay aware. Stay informed.'**
  String get stayAwareTagline;

  /// FAQ question 1
  ///
  /// In en, this message translates to:
  /// **'Why SAS?'**
  String get faqQuestion1;

  /// FAQ answer 1
  ///
  /// In en, this message translates to:
  /// **'Social media has become a primary source of real-time information. SAS leverages this by continuously scraping and analyzing data from platforms like Telegram and Twitter to identify events as they unfold.'**
  String get faqAnswer1;

  /// FAQ question 2
  ///
  /// In en, this message translates to:
  /// **'What is SAS?'**
  String get faqQuestion2;

  /// FAQ answer 2
  ///
  /// In en, this message translates to:
  /// **'SAS (Situational Awareness System) is a scalable platform that monitors, detects, and visualizes events using social media data with AI-powered crawlers.'**
  String get faqAnswer2;

  /// FAQ question 3
  ///
  /// In en, this message translates to:
  /// **'How does SAS detect events?'**
  String get faqQuestion3;

  /// FAQ answer 3
  ///
  /// In en, this message translates to:
  /// **'SAS leverages deep learning models, natural language processing, and clustering techniques to identify emerging events and determine their geographic locations.'**
  String get faqAnswer3;

  /// FAQ question 4
  ///
  /// In en, this message translates to:
  /// **'Who can use SAS?'**
  String get faqQuestion4;

  /// FAQ answer 4
  ///
  /// In en, this message translates to:
  /// **'SAS is designed for both the public and decision-makers. General users can explore events, while authorized monitors and analysts can update and verify event details.'**
  String get faqAnswer4;

  /// FAQ question 5
  ///
  /// In en, this message translates to:
  /// **'Is SAS free to use?'**
  String get faqQuestion5;

  /// FAQ answer 5
  ///
  /// In en, this message translates to:
  /// **'Basic access to the daily event map is open for everyone. Advanced features such as historical data, analytics, and personalized alerts require an account.'**
  String get faqAnswer5;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
