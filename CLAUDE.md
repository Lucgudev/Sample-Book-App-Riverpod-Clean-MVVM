# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter application for showing books (`sample_book_app`). 
This application is consist of 3 pages: Home (Book List), Book Details, and Author page. The app allows users to browse a list of books, view detailed information about each book, and see the author information and list of the book they wrote.
This app is built using Flutter framework and follows Material Design principles.
The codebase use Clean architecture principles to separate concerns and improve maintainability and using MVVM pattern for state management.

## Build System & Commands

### Development Commands
- `flutter pub get` - Install dependencies
- `flutter run` - Run the app in development mode with hot reload
- `flutter run --release` - Run the app in release mode
- `flutter devices` - List available devices/emulators
- `flutter run -d <device-id>` - Run on specific device

### Code Quality & Analysis
- `flutter analyze` - Run static analysis (configured via analysis_options.yaml)
- `flutter test` - Run all tests
- `flutter test test/widget_test.dart` - Run specific test file

### Build Commands
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app (requires macOS)
- `flutter build web` - Build web version
- `flutter clean` - Clean build cache and artifacts

### Dependencies
- `flutter pub upgrade` - Upgrade dependencies
- `flutter pub outdated` - Check for outdated dependencies

## Architecture
This project will follow Clean Architecture principles with MVVM pattern for state management. The codebase is organized into layers: data, domain, and presentation. The state management is handled using Riverpod package.

## Code Structure
There will be 4 main directories under `lib/`: core, data, domain, and presentation.
Inside data directory, there will be subdirectories for data_sources and repositories(only for the repository impl).
Inside data_sources, there will be local and remote subdirectories.

The domain layer will contain entities, repositories(only for the repository interface).

The presentation layer will contain screens and widgets.

### Project Structure
- `lib/main.dart` - Entry point with MyApp widget and basic counter functionality
- `test/widget_test.dart` - Widget tests for the main counter functionality
- `pubspec.yaml` - Flutter project configuration and dependencies
- `analysis_options.yaml` - Dart analyzer configuration with flutter_lints

### Current Implementation
The app currently implements a simple counter widget structure:
- `MyApp` - Root MaterialApp widget with theme configuration
- `MyHomePage` - StatefulWidget containing the counter logic
- `_MyHomePageState` - State management for counter increments

### Dependencies
- Uses Material Design (`cupertino_icons` for iOS-style icons)
- Linting configured with `flutter_lints: ^5.0.0`
- Dart SDK: `^3.7.0`

### Testing
- Widget testing setup with flutter_test
- Single smoke test for counter increment functionality
- Tests can be run with `flutter test`

## Development Notes

This project uses the default Flutter project structure and is configured for cross-platform development (Android, iOS, Web). The current codebase is the Flutter template counter app, suggesting this is a starting point for a book application to be built.

The project follows standard Flutter development practices with Material Design theming and includes basic linting rules through flutter_lints package.