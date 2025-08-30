import 'package:flutter/material.dart';

final class AppTheme {
  static const primaryColor = Color(
    0xFFD6F0FF,
  ); // Azul bebê bem suave, quase pastel
  static const secondaryColor = Color(
    0xFFBEE8FF,
  ); // Azul clarinho para fundos e destaques sutis
  static const darkTextColor = Color(
    0xFF3B7C9E,
  ); // Azul mais escuro para texto, bom contraste
  static const textColor = Color(
    0xFF6FB8D8,
  ); // Azul médio delicado para textos e ícones

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: primaryColor),
  );

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    useMaterial3: true,
    fontFamily: 'SFProDisplay',
    scaffoldBackgroundColor: primaryColor,
    dialogTheme: DialogThemeData(
      insetPadding: EdgeInsets.all(10),
      //backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      titleTextStyle: TextStyle(
        fontSize: 21,
        fontFamily: 'SFProDisplay',
        color: Colors.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: secondaryColor,
      labelStyle: _labelTextStyle,
      floatingLabelStyle: _floatingLabelTextStyle,
      disabledBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: darkTextColor),
      ),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: darkTextColor),
        foregroundColor: darkTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: _buttonTextStyle,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkTextColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: _buttonTextStyle,
      ),
    ),
  );

  static final darkTheme = lightTheme;

  static const titleStyle = TextStyle(
    fontFamily: 'SFProDisplay',
    color: darkTextColor,
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  static const titleSmallStyle = TextStyle(
    fontFamily: 'SFProDisplay',
    color: darkTextColor,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static const subTitleStyle = TextStyle(
    fontFamily: 'SFProDisplay',
    color: darkTextColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const textStyle = TextStyle(
    fontFamily: 'SFProDisplay',
    color: textColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const _labelTextStyle = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: 14,
    color: textColor,
    fontWeight: FontWeight.w700,
  );

  static const _floatingLabelTextStyle = TextStyle(
    fontFamily: 'SFProDisplay',
    color: darkTextColor,
    fontWeight: FontWeight.w600,
  );

  static const _buttonTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: 'SFProDisplay',
    fontWeight: FontWeight.w700,
  );
}
