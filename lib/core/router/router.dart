import 'package:flutter/material.dart';
import 'package:sample_book_app/core/router/routes.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';
import 'package:sample_book_app/presentation/screens/home/home_screen.dart';
import 'package:sample_book_app/presentation/screens/book_detail/book_detail_screen.dart';
import 'package:sample_book_app/presentation/screens/topic_books/topic_books_screen.dart';

class Router {
  static Map<String, Widget Function(BuildContext context)> generateRoute() {
    return {
      Routes.homeScreen: (context) => const HomeScreen(),
      Routes.bookScreen: (context) {
        final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        final bookId = args?['bookId'] as int? ?? 0;
        final bookData = args?['bookData'] as BookEntity?;
        return BookDetailScreen(bookId: bookId, bookData: bookData);
      },
      Routes.topicBookScreen: (context) {
        final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        final topic = args?['topic'] as String? ?? '';
        return TopicBooksScreen(topic: topic);
      },
    };
  }
}
