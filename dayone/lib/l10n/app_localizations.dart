import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

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
    Locale('en'),
    Locale('zh')
  ];

  /// Main title on intro screen
  ///
  /// In en, this message translates to:
  /// **'Tried to \"change\" but\nalways fail?'**
  String get introTitle;

  /// Subtitle text
  ///
  /// In en, this message translates to:
  /// **'Gym memberships. Phone breaks.\nEarly mornings... giving up after\na few days.'**
  String get introSubtitle;

  /// Problem section title
  ///
  /// In en, this message translates to:
  /// **'The root problem\nisn\'t willpower.'**
  String get introProblemTitle;

  /// Problem section subtitle
  ///
  /// In en, this message translates to:
  /// **'It\'s your \"identity\".'**
  String get introProblemSubtitle;

  /// Key concept text
  ///
  /// In en, this message translates to:
  /// **'Identity drives behavior.\nNot willpower drives behavior.'**
  String get introKeyPoint;

  /// CTA button text
  ///
  /// In en, this message translates to:
  /// **'Start Exploring'**
  String get startExploring;

  /// Next button
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Complete button
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// Skip button
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Finish button
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// Continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_;

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Answer placeholder
  ///
  /// In en, this message translates to:
  /// **'Your answer...'**
  String get yourAnswer;

  /// Reflection placeholder
  ///
  /// In en, this message translates to:
  /// **'Your reflection...'**
  String get yourReflection;

  /// Daily question
  ///
  /// In en, this message translates to:
  /// **'Who do you want to be today?'**
  String get whoDoYouWantToBeToday;

  /// Daily subtitle
  ///
  /// In en, this message translates to:
  /// **'Choose your identity for today'**
  String get chooseYourIdentity;

  /// Identity prefix
  ///
  /// In en, this message translates to:
  /// **'I am the type of person who...'**
  String get iAmTheTypePerson;

  /// Default identity
  ///
  /// In en, this message translates to:
  /// **'takes care of my health'**
  String get takesCaresOfHealth;

  /// Action section title
  ///
  /// In en, this message translates to:
  /// **'Today\'s action'**
  String get todaysAction;

  /// Action option
  ///
  /// In en, this message translates to:
  /// **'Morning workout'**
  String get morningWorkout;

  /// Action option
  ///
  /// In en, this message translates to:
  /// **'Read for 30 min'**
  String get readFor30Min;

  /// Action option
  ///
  /// In en, this message translates to:
  /// **'Meditation'**
  String get meditation;

  /// Check in button
  ///
  /// In en, this message translates to:
  /// **'Check In'**
  String get checkIn;

  /// Progress title
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// Streak label
  ///
  /// In en, this message translates to:
  /// **'Day Streak'**
  String get dayStreak;

  /// Level label
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// XP label
  ///
  /// In en, this message translates to:
  /// **'Total XP'**
  String get totalXp;

  /// Week section
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// Achievements section
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// Achievement name
  ///
  /// In en, this message translates to:
  /// **'First Step'**
  String get firstStep;

  /// Achievement description
  ///
  /// In en, this message translates to:
  /// **'Complete your first check-in'**
  String get firstStepDesc;

  /// Achievement name
  ///
  /// In en, this message translates to:
  /// **'7 Day Streak'**
  String get sevenDayStreak;

  /// Achievement description
  ///
  /// In en, this message translates to:
  /// **'Maintain a 7-day streak'**
  String get sevenDayStreakDesc;

  /// Achievement name
  ///
  /// In en, this message translates to:
  /// **'Identity Master'**
  String get identityMaster;

  /// Achievement description
  ///
  /// In en, this message translates to:
  /// **'Complete 3 identity cycles'**
  String get identityMasterDesc;

  /// Achievement name
  ///
  /// In en, this message translates to:
  /// **'Early Bird'**
  String get earlyBird;

  /// Achievement description
  ///
  /// In en, this message translates to:
  /// **'Check in before 8 AM'**
  String get earlyBirdDesc;

  /// Settings title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Language section
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Language setting
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get appLanguage;

  /// Language picker title
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// Notifications section
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Notification setting
  ///
  /// In en, this message translates to:
  /// **'Morning Reminder'**
  String get morningReminder;

  /// Notification setting
  ///
  /// In en, this message translates to:
  /// **'Daytime Prompts'**
  String get daytimePrompts;

  /// Notification setting
  ///
  /// In en, this message translates to:
  /// **'Evening Reflection'**
  String get eveningReflection;

  /// Data section
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get data;

  /// Export setting
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportData;

  /// Export subtitle
  ///
  /// In en, this message translates to:
  /// **'Download your data'**
  String get downloadYourData;

  /// Reset setting
  ///
  /// In en, this message translates to:
  /// **'Reset Progress'**
  String get resetProgress;

  /// Reset subtitle
  ///
  /// In en, this message translates to:
  /// **'Clear all data and start over'**
  String get clearAllData;

  /// About section
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Version label
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Privacy setting
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Terms setting
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// Question label
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get questionLabel;

  /// Step label
  ///
  /// In en, this message translates to:
  /// **'Step'**
  String get stepLabel;

  /// Skip button
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get skipForNow;

  /// Daytime question 1
  ///
  /// In en, this message translates to:
  /// **'What am I doing right now to escape something?'**
  String get daytimeQ1;

  /// Daytime question 2
  ///
  /// In en, this message translates to:
  /// **'Based on my behavior, what would someone conclude I want?'**
  String get daytimeQ2;

  /// Daytime question 3
  ///
  /// In en, this message translates to:
  /// **'Am I moving toward the life I hate or the one I want?'**
  String get daytimeQ3;

  /// Daytime question 4
  ///
  /// In en, this message translates to:
  /// **'What am I pretending isn\'t important?'**
  String get daytimeQ4;

  /// Daytime question 5
  ///
  /// In en, this message translates to:
  /// **'What did I do today that protected my identity rather than what I really wanted?'**
  String get daytimeQ5;

  /// Daytime question 6
  ///
  /// In en, this message translates to:
  /// **'When did I feel most alive today? When did I feel most dead?'**
  String get daytimeQ6;

  /// Evening question 1
  ///
  /// In en, this message translates to:
  /// **'What was your biggest insight today?'**
  String get eveningQ1;

  /// Evening question 2
  ///
  /// In en, this message translates to:
  /// **'What is the real enemy? (Not external, but internal patterns)'**
  String get eveningQ2;

  /// Evening question 3
  ///
  /// In en, this message translates to:
  /// **'In one sentence, what are you refusing to let your life become?'**
  String get eveningQ3;

  /// Evening question 4
  ///
  /// In en, this message translates to:
  /// **'In one sentence, what are you building toward?'**
  String get eveningQ4;

  /// Evening question 5
  ///
  /// In en, this message translates to:
  /// **'What must happen in one year?'**
  String get eveningQ5;

  /// Evening question 6
  ///
  /// In en, this message translates to:
  /// **'What must happen in one month?'**
  String get eveningQ6;

  /// Evening question 7
  ///
  /// In en, this message translates to:
  /// **'What 2-3 actions will you time-block for tomorrow?'**
  String get eveningQ7;

  /// Achievement popup title
  ///
  /// In en, this message translates to:
  /// **'ACHIEVEMENT UNLOCKED'**
  String get achievementUnlocked;

  /// Dismiss button
  ///
  /// In en, this message translates to:
  /// **'AWESOME!'**
  String get awesome;

  /// Morning greeting
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodMorning;

  /// Afternoon greeting
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon'**
  String get goodAfternoon;

  /// Evening greeting
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get goodEvening;
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
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
