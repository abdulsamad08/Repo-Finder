import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchURL(uri.toString());
  } else {
    throw 'Could not launch $url';
  }
}
