import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Sample Book App'**
  String get appTitle;

  /// Books title for home screen
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get books;

  /// Book details screen title
  ///
  /// In en, this message translates to:
  /// **'Book Details'**
  String get bookDetails;

  /// Placeholder text for search bar
  ///
  /// In en, this message translates to:
  /// **'Search books...'**
  String get searchBooksHint;

  /// Topic books screen title
  ///
  /// In en, this message translates to:
  /// **'Topic: {topic}'**
  String topicTitle(String topic);

  /// Text shown when author information is not available
  ///
  /// In en, this message translates to:
  /// **'Unknown Author'**
  String get unknownAuthor;

  /// Error state title
  ///
  /// In en, this message translates to:
  /// **'Oops'**
  String get oops;

  /// Default empty state message
  ///
  /// In en, this message translates to:
  /// **'No data found'**
  String get noDataFound;

  /// Empty state message when no books are available
  ///
  /// In en, this message translates to:
  /// **'No books found'**
  String get noBooksFound;

  /// Empty state message for topic books screen
  ///
  /// In en, this message translates to:
  /// **'No books found for \"{topic}\"'**
  String noBooksFoundForTopic(String topic);

  /// Retry button text
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// Retry button text for error states
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Error message when book details fail to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load book details'**
  String get failedToLoadBookDetails;

  /// Message when no book data is available
  ///
  /// In en, this message translates to:
  /// **'No book data available'**
  String get noBookDataAvailable;

  /// Book information section title
  ///
  /// In en, this message translates to:
  /// **'Book Information'**
  String get bookInformation;

  /// Book summary section title
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// Single author section title
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get author;

  /// Multiple authors section title
  ///
  /// In en, this message translates to:
  /// **'Authors'**
  String get authors;

  /// Book subjects section title
  ///
  /// In en, this message translates to:
  /// **'Subjects'**
  String get subjects;

  /// Book bookshelves section title
  ///
  /// In en, this message translates to:
  /// **'Bookshelves'**
  String get bookshelves;

  /// Book statistics section title
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// Book formats section title
  ///
  /// In en, this message translates to:
  /// **'Available Formats'**
  String get availableFormats;

  /// Book ID label
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get id;

  /// Book language label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Book media type label
  ///
  /// In en, this message translates to:
  /// **'Media Type'**
  String get mediaType;

  /// Book copyright label
  ///
  /// In en, this message translates to:
  /// **'Copyright'**
  String get copyright;

  /// Book downloads label
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get downloads;

  /// Download count with times suffix
  ///
  /// In en, this message translates to:
  /// **'{count} times'**
  String downloadsTimes(String count);

  /// Number of formats label
  ///
  /// In en, this message translates to:
  /// **'Formats'**
  String get formats;

  /// Affirmative response
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// Negative response
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// Used for author death year when still alive
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get present;
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
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
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
