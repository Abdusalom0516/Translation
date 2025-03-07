import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/core/constants/colors.dart';

class AppStateWrapper extends ConsumerWidget {
  final Widget Function(WidgetRef ref, AppColors colors) builder;
  const AppStateWrapper({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppColors colors = AppColors();
    return builder(ref, colors);
  }
}
