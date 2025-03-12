import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeachService {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String message, String language) async {
    await flutterTts.setPitch(1);
    await flutterTts.setLanguage(language);
    await flutterTts.speak(message);
  }
}
