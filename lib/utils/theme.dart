import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData primaryTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: greenDarker,
    fontFamily: AvailableFonts.primaryFont,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
