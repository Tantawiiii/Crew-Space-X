
import 'package:flutter/material.dart';

class ColorsCode {

  static Color  blackColor = hexToColor('#00000000');
  static Color  blackColor100 = hexToColor('#1E1E1E');
  static Color  blackColor700 = hexToColor('#373737');
  static Color  whiteColor = hexToColor('#FFFFFF');
  static Color  whiteColor100 = hexToColor('#F1F4FF');
  static Color  whiteColor200 = hexToColor('#EDEEF5');
  static Color  whiteColor300 = hexToColor('#E3E3E3');
  static Color  blue500 = hexToColor('#081B35');



}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}