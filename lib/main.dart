import 'package:flutter/material.dart';
import 'package:translation/core/utils/app_responsive.dart';
import 'package:translation/core/utils/app_state_wrapper.dart';
import 'package:translation/presentation/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return AppStateWrapper(
      builder: (ref, colors) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: ThemeData(
          splashFactory: NoSplash.splashFactory,
          splashColor: colors.bg,
          highlightColor: colors.bg,
          appBarTheme: AppBarTheme(
            // elevation: 0.5,
            surfaceTintColor: colors.blue,
            centerTitle: false,
            // scrolledUnderElevation: 2,
            toolbarHeight: appH(60),
            foregroundColor: colors.bg,
            backgroundColor: colors.blue,
            titleTextStyle: TextStyle(
              color: colors.bg,
              fontSize: appW(19),
              fontWeight: FontWeight.w600,
            ),
          ),
          scaffoldBackgroundColor: colors.bg,
        ),
      ),
    );
  }
}
