import 'package:flutter/material.dart';

/** 프로젝트에서 사용하는 모든 텍스트의 규격을 지정하고 관리하는 클래스 */

class Typografie {
  Widget DisplayLarge(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 55.0,
        fontWeight: FontWeight.w700,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget DisplayMedium(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 45.0,
        fontWeight: FontWeight.w700,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget DisplaySmall(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 35.0,
        fontWeight: FontWeight.w700,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget HeadlineLarge(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 33.0,
        fontWeight: FontWeight.w500,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget HeadlineMedium(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 31.0,
        fontWeight: FontWeight.w300,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget HeadlineSmall(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 29.0,
        fontWeight: FontWeight.w100,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget TitleLarge(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 27.0,
        fontWeight: FontWeight.w500,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget TitleMedium(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 25.0,
        fontWeight: FontWeight.w300,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget TitleSamll(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 23.0,
        fontWeight: FontWeight.w100,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget LabelLarge(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 21.0,
        fontWeight: FontWeight.w500,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget LabelMedium(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 19.0,
        fontWeight: FontWeight.w300,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget LabelSamll(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 17.0,
        fontWeight: FontWeight.w100,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget BodyLarge(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget BodyMedium(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 13.0,
        fontWeight: FontWeight.w300,
        fontFamily: "NotoSans",
      ),
    );
  }

  Widget BodySmall(String? text, Color? color) {
    return Text(
      "$text",
      style: TextStyle(
        color: color,
        fontSize: 11.0,
        fontWeight: FontWeight.w100,
        fontFamily: "NotoSans",
      ),
    );
  }
}
