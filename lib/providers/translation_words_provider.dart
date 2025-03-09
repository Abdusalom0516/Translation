import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator/translator.dart';

class TranslationPeriod {
  String? value;
  bool isLoading;

  TranslationPeriod({required this.isLoading, required this.value});

  TranslationPeriod updateState({bool? isLoading, String? value}) {
    return TranslationPeriod(
      isLoading: isLoading ?? this.isLoading,
      value: value,
    );
  }
}

class TranslationWordsProvider extends StateNotifier<TranslationPeriod> {
  TranslationWordsProvider()
      : super(TranslationPeriod(value: null, isLoading: false));

  Future<void> translate(String from, String to, String word) async {
    state = state.updateState(isLoading: true, value: "");
    GoogleTranslator translator = GoogleTranslator();

    Translation result = await translator.translate(word, from: from, to: to);
    state = state.updateState(value: result.text, isLoading: false);
  }

  void clean() async {
    state = state.updateState(value: "");
  }
}

final translationWordsProvider =
    StateNotifierProvider<TranslationWordsProvider, TranslationPeriod>(
  (ref) => TranslationWordsProvider(),
);
