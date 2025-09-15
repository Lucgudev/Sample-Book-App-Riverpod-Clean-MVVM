// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Sample Book App';

  @override
  String get books => 'Books';

  @override
  String get bookDetails => 'Book Details';

  @override
  String get searchBooksHint => 'Search books...';

  @override
  String topicTitle(String topic) {
    return 'Topic: $topic';
  }

  @override
  String get unknownAuthor => 'Unknown Author';

  @override
  String get oops => 'Oops';

  @override
  String get noDataFound => 'No data found';

  @override
  String get noBooksFound => 'No books found';

  @override
  String noBooksFoundForTopic(String topic) {
    return 'No books found for \"$topic\"';
  }

  @override
  String get tryAgain => 'Try Again';

  @override
  String get retry => 'Retry';

  @override
  String get failedToLoadBookDetails => 'Failed to load book details';

  @override
  String get noBookDataAvailable => 'No book data available';

  @override
  String get bookInformation => 'Book Information';

  @override
  String get summary => 'Summary';

  @override
  String get author => 'Author';

  @override
  String get authors => 'Authors';

  @override
  String get subjects => 'Subjects';

  @override
  String get bookshelves => 'Bookshelves';

  @override
  String get statistics => 'Statistics';

  @override
  String get availableFormats => 'Available Formats';

  @override
  String get id => 'ID';

  @override
  String get language => 'Language';

  @override
  String get mediaType => 'Media Type';

  @override
  String get copyright => 'Copyright';

  @override
  String get downloads => 'Downloads';

  @override
  String downloadsTimes(String count) {
    return '$count times';
  }

  @override
  String get formats => 'Formats';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get present => 'Present';
}
