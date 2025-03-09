import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToProvider extends StateNotifier<String> {
  ToProvider() : super("uz");

  void changeLanguageCode({required String newLangCode}) {
    state = newLangCode;
  }
}

final toProvider = StateNotifierProvider<ToProvider, String>((ref) => ToProvider(),);
