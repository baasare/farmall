import 'package:flutter/painting.dart';

String capitalize(String string) {
  if (string.isEmpty) {
    return string;
  }

  return string[0].toUpperCase() + string.substring(1);
}

String humanize(String str) {
  var i, frags = str.split('_');
  for (i = 0; i < frags.length; i++) {
    frags[i] = frags[i][0].toUpperCase() + frags[i].substring(1);
  }
  return frags.join(' ');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
