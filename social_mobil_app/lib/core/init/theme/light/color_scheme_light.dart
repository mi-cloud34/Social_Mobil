import 'package:flutter/material.dart';

class ColorSchemeLight {
  ColorSchemeLight._init();
  static ColorSchemeLight? _instace;
  static ColorSchemeLight? get instance {
    _instace ??= ColorSchemeLight._init();
    return _instace;
  }

  final Color purple = const Color(0xff69389A);
  final Color red = const Color(0xffc10e0e);
  final Color white = const Color(0xffffffff);
  final Color gray = const Color(0xffa5a6ae);
  final Color lightGray = const Color(0xfff7f7f7);
  final Color darkGray = const Color(0xff676870);
  final Color black = const Color(0xff020306);
  final Color orange = const Color.fromARGB(255, 209, 170, 15);
  final Color lightOrange = const Color.fromARGB(255, 206, 191, 125);
  final Color lightGreen = const Color.fromARGB(212, 14, 157, 62);

  final Color azure = const Color(0xff27928d);
}
