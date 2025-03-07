import 'package:flutter/material.dart';
import 'package:translation/core/utils/app_responsive.dart';

Widget w(double width) {
  return SizedBox(
    width: AppResponsive.width(width),
  );
}

Widget h(double height) {
  return SizedBox(
    height: AppResponsive.height(height),
  );
}
