import 'dart:async';
import 'dart:convert';

import 'package:flutter/painting.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

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

Future<String> getAddressFormCoordinates(LatLng coordinates) async {
  String baseURL = 'https://maps.googleapis.com/maps/api/geocode/json';

  String request =
      '$baseURL?latlng=${coordinates.latitude},${coordinates.longitude}&key=${FlutterConfig.get('GOOGLE_MAPS_API_KEY')}';

  var httpResponse = await http.get(Uri.parse(request));
  final httpBody = json.decode(httpResponse.body);
  final httpResults = httpBody['results'];
  if (httpResults.length > 0)
    return httpResults[0]['formatted_address'].toString();
  else
    return "";
}
