import 'package:flutter/material.dart';

const Map<int, Color> _amethyst = {
  50: Color.fromRGBO(155, 89, 182, .1),
  100: Color.fromRGBO(155, 89, 182, .2),
  200: Color.fromRGBO(155, 89, 182, .3),
  300: Color.fromRGBO(155, 89, 182, .4),
  400: Color.fromRGBO(155, 89, 182, .5),
  500: Color.fromRGBO(155, 89, 182, .6),
  600: Color.fromRGBO(155, 89, 182, .7),
  700: Color.fromRGBO(155, 89, 182, .8),
  800: Color.fromRGBO(155, 89, 182, .9),
  900: Color.fromRGBO(155, 89, 182, 1.0)
};

const Map<int, Color> _wetAsphalt = {
  50: Color.fromRGBO(52, 73, 94, .1),
  100: Color.fromRGBO(52, 73, 94, .2),
  200: Color.fromRGBO(52, 73, 94, .3),
  300: Color.fromRGBO(52, 73, 94, .4),
  400: Color.fromRGBO(52, 73, 94, .5),
  500: Color.fromRGBO(52, 73, 94, .6),
  600: Color.fromRGBO(52, 73, 94, .7),
  700: Color.fromRGBO(52, 73, 94, .8),
  800: Color.fromRGBO(52, 73, 94, .9),
  900: Color.fromRGBO(52, 73, 94, 1.0)
};

const Map<int, Color> _clouds = {
  50: Color.fromRGBO(236, 240, 241, .1),
  100: Color.fromRGBO(236, 240, 241, .2),
  200: Color.fromRGBO(236, 240, 241, .3),
  300: Color.fromRGBO(236, 240, 241, .4),
  400: Color.fromRGBO(236, 240, 241, .5),
  500: Color.fromRGBO(236, 240, 241, .6),
  600: Color.fromRGBO(236, 240, 241, .7),
  700: Color.fromRGBO(236, 240, 241, .8),
  800: Color.fromRGBO(236, 240, 241, .9),
  900: Color.fromRGBO(236, 240, 241, 1.0)
};

const Map<int, Color> _peterRiver = {
  50: Color.fromRGBO(52, 152, 219, .1),
  100: Color.fromRGBO(52, 152, 219, .2),
  200: Color.fromRGBO(52, 152, 219, .3),
  300: Color.fromRGBO(52, 152, 219, .4),
  400: Color.fromRGBO(52, 152, 219, .5),
  500: Color.fromRGBO(52, 152, 219, .6),
  600: Color.fromRGBO(52, 152, 219, .7),
  700: Color.fromRGBO(52, 152, 219, .8),
  800: Color.fromRGBO(52, 152, 219, .9),
  900: Color.fromRGBO(52, 152, 219, 1.0)
};

const Map<int, Color> _emerald = {
  50: Color.fromRGBO(46, 204, 113, .1),
  100: Color.fromRGBO(46, 204, 113, .2),
  200: Color.fromRGBO(46, 204, 113, .3),
  300: Color.fromRGBO(46, 204, 113, .4),
  400: Color.fromRGBO(46, 204, 113, .5),
  500: Color.fromRGBO(46, 204, 113, .6),
  600: Color.fromRGBO(46, 204, 113, .7),
  700: Color.fromRGBO(46, 204, 113, .8),
  800: Color.fromRGBO(46, 204, 113, .9),
  900: Color.fromRGBO(46, 204, 113, 1.0)
};

const Map<int, Color> _turquoise = {
  50: Color.fromRGBO(26, 188, 156, .1),
  100: Color.fromRGBO(26, 188, 156, .2),
  200: Color.fromRGBO(26, 188, 156, .3),
  300: Color.fromRGBO(26, 188, 156, .4),
  400: Color.fromRGBO(26, 188, 156, .5),
  500: Color.fromRGBO(26, 188, 156, .6),
  600: Color.fromRGBO(26, 188, 156, .7),
  700: Color.fromRGBO(26, 188, 156, .8),
  800: Color.fromRGBO(26, 188, 156, .9),
  900: Color.fromRGBO(26, 188, 156, 1.0)
};

const Map<int, Color> _concrete = {
  50: Color.fromRGBO(149, 165, 166, .1),
  100: Color.fromRGBO(149, 165, 166, .2),
  200: Color.fromRGBO(149, 165, 166, .3),
  300: Color.fromRGBO(149, 165, 166, .4),
  400: Color.fromRGBO(149, 165, 166, .5),
  500: Color.fromRGBO(149, 165, 166, .6),
  600: Color.fromRGBO(149, 165, 166, .7),
  700: Color.fromRGBO(149, 165, 166, .8),
  800: Color.fromRGBO(149, 165, 166, .9),
  900: Color.fromRGBO(149, 165, 166, 1.0)
};

class AppColors {
  static const MaterialColor turquoiseMColor =
      MaterialColor(0xFF1ABC9C, _turquoise);
  static const MaterialColor emeraldMColor =
      MaterialColor(0xFF2ECC71, _emerald);
  static const MaterialColor peterRiverMColor =
      MaterialColor(0xFF3498DB, _peterRiver);
  static const MaterialColor cloudsMColor = MaterialColor(0xFFECF0F1, _clouds);
  static const MaterialColor wetAsphaltMColor =
      MaterialColor(0xFF34495E, _wetAsphalt);
  static const MaterialColor amethystMColor =
      MaterialColor(0xFF9B59B6, _amethyst);
  static const MaterialColor concreteMColor =
      MaterialColor(0xFF95A5A6, _concrete);

  static var turquoiseColor = turquoiseMColor.shade900;
  static var emeraldColor = emeraldMColor.shade900;
  static var peterRiverColor = peterRiverMColor.shade900;
  static var cloudsColor = cloudsMColor.shade900;
  static var wetAsphaltColor = wetAsphaltMColor.shade900;
  static var amethystColor = amethystMColor.shade900;
  static var concreteColor = concreteMColor.shade200;
  static var asbestosColor = Color.fromRGBO(127, 140, 141, 1.0);
}
