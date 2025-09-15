import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'url_launcher_service.g.dart';

@riverpod
UrlLauncherService urlLauncherService(UrlLauncherServiceRef ref) {
  return UrlLauncherServiceImpl();
}

abstract class UrlLauncherService {
  Future<void> openUrl(String url);
}

class UrlLauncherServiceImpl implements UrlLauncherService {
  @override
  Future<void> openUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      await launchUrl(uri);
    } catch (e) {
      throw Exception('Could not launch $url: $e');
    }
  }
}
