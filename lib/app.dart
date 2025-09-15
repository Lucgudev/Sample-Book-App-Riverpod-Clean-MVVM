import 'package:flutter/material.dart' hide Router;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sample_book_app/l10n/app_localizations.dart';
import 'core/provider/global_provider.dart';
import 'core/router/router.dart';
import 'core/router/routes.dart';
import 'core/theme/app_theme.dart';

class SampleBookApp extends ConsumerStatefulWidget {
  const SampleBookApp({super.key});

  @override
  ConsumerState<SampleBookApp> createState() => _SampleBookAppState();
}

class _SampleBookAppState extends ConsumerState<SampleBookApp> {
  GlobalKey<NavigatorState>? _navigatorKey;

  @override
  void initState() {
    super.initState();
    _navigatorKey = ref.read(navigatorKeyProvider);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Book App',
      navigatorKey: _navigatorKey,
      routes: Router.generateRoute(),
      initialRoute: Routes.homeScreen,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
      ],
    );
  }
}
