import 'package:app/utilities/palette.dart';
import 'package:flutter/material.dart';

//formatted title
Widget title(String? text) {
  return Text(
    "$text",
    style: TextStyle(
      color: Palette.sapphire,
      fontSize: 35.0,
      fontWeight: FontWeight.w600,
    ),
  );
}

//formatted subtitle
Widget subtitle(String? text) {
  return Text(
    "$text",
    style: TextStyle(
      color: Palette.jetblack,
      fontSize: 19.0,
      fontWeight: FontWeight.w300,
    ),
  );
}
