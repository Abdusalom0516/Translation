import 'package:flutter_riverpod/flutter_riverpod.dart';

class FromProvider extends StateNotifier<String> {
  FromProvider() : super("en");

  void changeLanguageCode({required String newLangCode}) {
    state = newLangCode;
  }
}

final fromProvider = StateNotifierProvider<FromProvider, String>((ref) => FromProvider(),);
