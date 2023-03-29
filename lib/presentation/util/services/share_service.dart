import 'package:share_plus/share_plus.dart';

class ShareService {
  static Future<void> share({String? text, String? linkUrl}) async {
    await Share.share(
      linkUrl ?? '',
      subject: text ?? '',
    );
  }
}
