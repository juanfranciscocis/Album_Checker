import 'dart:io';

class AdHelper {
  static String get interstitialAdID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3104071700346749/3178884728';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3104071700346749/2972082735';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}