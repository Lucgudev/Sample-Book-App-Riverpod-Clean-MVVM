import 'package:flutter/material.dart';
import 'package:sample_book_app/core/router/routes.dart';
import 'package:sample_book_app/presentation/screens/home/home_screen.dart';

class Router {
  static Map<String, Widget Function(BuildContext context)> generateRoute() {
    return {Routes.homeScreen: (context) => const HomeScreen()};
  }
}
