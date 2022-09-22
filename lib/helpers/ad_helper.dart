import 'dart:io';

class AdHelper {
  static String get interstitialAdID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1404676216890712/8657779407';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-1404676216890712/9165045868';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}