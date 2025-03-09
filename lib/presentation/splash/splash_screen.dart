import 'dart:async';

import 'package:flutter/material.dart';
import 'package:translation/core/common/widgets/sizedbox.dart';
import 'package:translation/core/constants/img_paths.dart';
import 'package:translation/core/utils/app_responsive.dart';
import 'package:translation/core/utils/app_state_wrapper.dart';
import 'package:translation/presentation/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(milliseconds: 2300),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      },
    );
    return AppStateWrapper(
      builder: (ref, colors) => Scaffold(
        backgroundColor: colors.bg,
        body: Stack(
          children: [
            Transform.translate(
              offset: Offset(appW(-75), appH(-127)),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  ImgPaths.blueCircle,
                  fit: BoxFit.contain,
                  height: appH(410),
                  width: appW(446),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(appW(75), appH(-157)),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  ImgPaths.orangeCircle,
                  fit: BoxFit.contain,
                  height: appH(410),
                  width: appW(446),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImgPaths.logo,
                    height: appH(82),
                    width: appW(99),
                  ),
                  h(15),
                  Text(
                    "Translate on the Go",
                    style: TextStyle(
                      color: colors.black,
                      fontSize: appW(20),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
