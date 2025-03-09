import 'package:clipboard/clipboard.dart';

class Clipboard {
  static void copy(String text) async {
    await FlutterClipboard.copy(text);
  }
}
