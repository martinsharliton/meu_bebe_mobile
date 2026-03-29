import 'package:flutter/material.dart';

final class AppTheme {
  static const primaryColor = Color(0xFFFFF6F9);
  static const secondaryColor = Color(0xFFFFC2D1);
  static const darkTextColor = Color(0xFFB8336A);
  static const textColor = Color(0xFFE75480);

  static const surfaceColor = Colors.white;
  static const dividerColor = Color(0xFFFFD6E0);
  static const iconColor = darkTextColor;

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: secondaryColor),
  );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Cabin',

    scaffoldBackgroundColor: primaryColor,

    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, primary: darkTextColor, secondary: secondaryColor),

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: titleStyle,
      iconTheme: IconThemeData(color: darkTextColor),
    ),

    iconTheme: const IconThemeData(color: iconColor, size: 24),

    dividerTheme: const DividerThemeData(color: dividerColor, thickness: 1, space: 24),

    cardTheme: CardThemeData(
      elevation: 0,
      color: surfaceColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      margin: const EdgeInsets.symmetric(vertical: 8),
    ),

    listTileTheme: const ListTileThemeData(
      iconColor: darkTextColor,
      textColor: darkTextColor,
      titleTextStyle: subTitleStyle,
      subtitleTextStyle: textStyle,
    ),

    dialogTheme: DialogThemeData(
      insetPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
      titleTextStyle: titleStyle.copyWith(fontSize: 22),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: darkTextColor,
      contentTextStyle: const TextStyle(color: Colors.white, fontFamily: 'Cabin'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      behavior: SnackBarBehavior.floating,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: secondaryColor,
      selectedColor: darkTextColor,
      labelStyle: const TextStyle(fontFamily: 'Cabin', fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: surfaceColor, elevation: 0),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: darkTextColor,
      foregroundColor: Colors.white,
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

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: darkTextColor, textStyle: _buttonTextStyle),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10),
        backgroundColor: titleStyle.color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: _buttonTextStyle,
      ),
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: darkTextColor,
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
        backgroundColor: const WidgetStatePropertyAll(primaryColor),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 10)),
      ),
    ),
  );

  static final darkTheme = lightTheme;

  // TITLES

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

  // BODY

  static const textStyle = TextStyle(fontFamily: 'Cabin', color: textColor, fontSize: 16);

  static const bodySmall = TextStyle(fontFamily: 'Cabin', color: textColor, fontSize: 14);

  static const caption = TextStyle(fontFamily: 'Cabin', color: textColor, fontSize: 12);

  // INTERNAL

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
