import 'package:flutter/material.dart';

extension TextThemeExtension on TextStyle {
  TextStyle get fontWeightBold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get fontWeightNormal => copyWith(fontWeight: FontWeight.normal);

  TextStyle get fontWeightW400 => copyWith(fontWeight: FontWeight.w400);

  TextStyle get fontSizeSmall => copyWith(fontSize: 12);

  TextStyle get fontSizeMedium => copyWith(fontSize: 14);

  TextStyle get fontSizeLarge => copyWith(fontSize: 18);

  TextStyle setFontSize(double fontSize) => copyWith(fontSize: fontSize);

  TextStyle setColor(Color color) => copyWith(color: color);

  TextStyle setFontWeight(FontWeight fw) => copyWith(fontWeight: fw);

  TextStyle setLetterSpacings(double ls) => copyWith(letterSpacing: ls);
}
