import 'package:flutter/foundation.dart';
import 'dart:js' as js;

class URLService {
  static Future<bool> canLaunchUrl(Uri uri) async {
    // For web, we can always try to launch URLs
    return true;
  }

  static Future<bool> launchUrl(Uri uri) async {
    try {
      if (kIsWeb) {
        // For web, use window.open to launch URLs
        js.context.callMethod('open', [uri.toString(), '_blank']);
        return true;
      } else {
        // For mobile, we'll just return true for now
        // TODO: Re-implement when url_launcher compatibility is fixed
        print('Would launch URL: $uri');
        return true;
      }
    } catch (e) {
      print('Error launching URL: $e');
      return false;
    }
  }

  static Future<bool> launchUrlString(String url) async {
    return launchUrl(Uri.parse(url));
  }
}
