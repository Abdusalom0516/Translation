import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator/translator.dart';

class TranslationWordsProvider extends StateNotifier<String?> {
  TranslationWordsProvider() : super(null);

  Future<void> translate(String from, String to, String word) async {
    GoogleTranslator translator = GoogleTranslator();

    Translation result = await translator.translate(word, from: from, to: to);
    state = result.text;
  }

  void clean() async {
    state = "";
  }
}

final translationWordsProvider =
    StateNotifierProvider<TranslationWordsProvider, String?>(
  (ref) => TranslationWordsProvider(),
);
