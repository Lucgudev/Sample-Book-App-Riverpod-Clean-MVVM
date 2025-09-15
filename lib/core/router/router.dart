import 'package:flutter/material.dart';
import 'package:sample_book_app/core/router/routes.dart';
import 'package:sample_book_app/presentation/screens/home/home_screen.dart';
import 'package:sample_book_app/presentation/screens/book_detail/book_detail_screen.dart';

class Router {
  static Map<String, Widget Function(BuildContext context)> generateRoute() {
    return {
      Routes.homeScreen: (context) => const HomeScreen(),
      Routes.bookScreen: (context) {
        final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        final bookId = args?['bookId'] as int? ?? 0;
        return BookDetailScreen(bookId: bookId);
      },
    };
  }
}
