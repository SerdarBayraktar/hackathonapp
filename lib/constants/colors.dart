import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class
  static const white = Color(0XFFFFFFFF);
  static const black = Color(0XFF0C0D11);
  static const dark_blue = Color(0XFF1E90FF);
  static const grey = Color(0XFF616E7E);
  static const blue_grey = Color(0XFFA3ADC3);
  static const dark_purple = Color(0XFF1A0026);
  static const soft_purple = Color(0XFF9F9BB9);
  static const sand = Color(0XFFC3B28A);
  static const light_grey = Color(0XFFD9D9D9);
  static const red = Color(0XFFCC0000);
  static const blue = Color(0XFF1A406D);

  static const secondaryGradient = LinearGradient(colors: [
    Color(0xFFA3ADC3),
    Color(0xFF9F9BB9),
  ]);
}
