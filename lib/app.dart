import 'package:flutter/material.dart' hide Router;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/provider/global_provider.dart';
import 'core/router/router.dart';
import 'core/router/routes.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
