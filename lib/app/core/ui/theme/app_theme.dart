import 'package:flutter/material.dart';

final class AppTheme {
  static const primaryColor = Color(0xFFFFF6F9); // Rosa muito claro, quase branco, para fundo
  static const secondaryColor = Color(0xFFFFC2D1); // Rosa pastel quente, aconchegante
  static const darkTextColor = Color(0xFFB8336A); // Rosa framboesa profundo para contraste
  static const textColor = Color(0xFFE75480); // Rosa vibrante elegante para títulos e destaques

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: secondaryColor),
  );

  static final lightTheme = ThemeData(
    appBarTheme: AppBarThemeData(
      backgroundColor: primaryColor,
      titleTextStyle: AppTheme.titleStyle,
      iconTheme: IconThemeData(color: darkTextColor),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    useMaterial3: true,
    fontFamily: 'Cabin',
    scaffoldBackgroundColor: primaryColor,
    dialogTheme: DialogThemeData(
      insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
      titleTextStyle: AppTheme.titleStyle.copyWith(fontSize: 22, fontFamily: 'Cabin'),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: primaryColor,
      labelStyle: _labelTextStyle,
      floatingLabelStyle: _floatingLabelTextStyle,
      disabledBorder: _defaultInputBorder.copyWith(borderSide: const BorderSide(color: darkTextColor)),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(borderSide: const BorderSide(color: Colors.red)),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: darkTextColor),
        foregroundColor: darkTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: _buttonTextStyle,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkTextColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: _buttonTextStyle,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      strokeCap: StrokeCap.round,
      strokeWidth: 3.5,
      borderRadius: BorderRadius.circular(12),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: primaryColor,
        labelStyle: _labelTextStyle,
        floatingLabelStyle: _floatingLabelTextStyle,
        disabledBorder: _defaultInputBorder.copyWith(borderSide: const BorderSide(color: darkTextColor)),
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        errorBorder: _defaultInputBorder.copyWith(borderSide: const BorderSide(color: Colors.red)),
      ),
      menuStyle: MenuStyle(
        backgroundColor: const WidgetStatePropertyAll(AppTheme.secondaryColor),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10)),
      ),
    ),
  );

  static final darkTheme = lightTheme;

  static const titleStyle = TextStyle(
    fontFamily: 'Cabin',
    color: darkTextColor,
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  static const titleSmallStyle = TextStyle(
    fontFamily: 'Cabin',
    color: darkTextColor,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static const subTitleStyle = TextStyle(
    fontFamily: 'Cabin',
    color: darkTextColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const textStyle = TextStyle(
    fontFamily: 'Cabin',
    color: textColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const _labelTextStyle = TextStyle(
    fontFamily: 'Cabin',
    fontSize: 14,
    color: textColor,
    fontWeight: FontWeight.w700,
  );

  static const _floatingLabelTextStyle = TextStyle(
    fontFamily: 'Cabin',
    color: darkTextColor,
    fontWeight: FontWeight.w600,
  );

  static const _buttonTextStyle = TextStyle(fontSize: 14, fontFamily: 'Cabin', fontWeight: FontWeight.w700);
}
