import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  try {
    await launch(url, forceWebView: true);
  } catch (e) {
    print('erro $e');
  }
}