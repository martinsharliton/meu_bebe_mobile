import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => Color(0xFFFFF6F9);

  Color get secondary => Color(0xFFFFC2D1);

  Color get darkText => Color(0xFFB8336A);

  Color get text => Color(0xFFE75480);

  Color get surface => Colors.white;

  Color get divider => Color(0xFFFFD6E0);

  Color get icon => darkText;

  // Color get lightGrey => const Color(0xFFDADADA);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
