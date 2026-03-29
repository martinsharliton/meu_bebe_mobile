import 'package:flutter/material.dart';

import 'styles/colors_app.dart';
import 'styles/text_styles.dart';

class AppTheme {
  AppTheme._();

  static final colors = ColorsApp.instance;
  static final textStyles = TextStyles.instance;

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: colors.secondary),
  );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Cabin',

    scaffoldBackgroundColor: colors.primary,

    colorScheme: ColorScheme.fromSeed(seedColor: colors.primary, primary: colors.darkText, secondary: colors.secondary),

    appBarTheme: AppBarTheme(
      backgroundColor: colors.primary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: textStyles.titleStyle,
      iconTheme: IconThemeData(color: colors.darkText),
    ),

    iconTheme: IconThemeData(color: colors.icon, size: 24),

    dividerTheme: DividerThemeData(color: colors.divider, thickness: 1, space: 24),

    cardTheme: CardThemeData(
      elevation: 0,
      color: colors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      margin: const EdgeInsets.symmetric(vertical: 8),
    ),

    listTileTheme: ListTileThemeData(
      iconColor: colors.darkText,
      textColor: colors.darkText,
      titleTextStyle: textStyles.subTitleStyle,
      subtitleTextStyle: textStyles.textStyle,
    ),

    dialogTheme: DialogThemeData(
      insetPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
      titleTextStyle: textStyles.titleStyle.copyWith(fontSize: 22),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: colors.darkText,
      contentTextStyle: const TextStyle(color: Colors.white, fontFamily: 'Cabin'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      behavior: SnackBarBehavior.floating,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: colors.secondary,
      selectedColor: colors.darkText,
      labelStyle: const TextStyle(fontFamily: 'Cabin', fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    bottomSheetTheme: BottomSheetThemeData(backgroundColor: colors.surface, elevation: 0),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colors.darkText,
      foregroundColor: Colors.white,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colors.primary,
      labelStyle: textStyles.labelTextStyle,
      floatingLabelStyle: textStyles.floatingLabelTextStyle,
      disabledBorder: _defaultInputBorder.copyWith(borderSide: BorderSide(color: colors.darkText)),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(borderSide: const BorderSide(color: Colors.red)),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: colors.darkText),
        foregroundColor: colors.darkText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: textStyles.buttonTextStyle,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: colors.darkText, textStyle: textStyles.buttonTextStyle),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10),
        backgroundColor: textStyles.titleStyle.color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: textStyles.buttonTextStyle,
      ),
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colors.darkText,
      strokeCap: StrokeCap.round,
      strokeWidth: 3.5,
      borderRadius: BorderRadius.circular(12),
    ),

    tabBarTheme: TabBarThemeData(
      labelColor: colors.darkText,
      indicator: BoxDecoration(
        border: Border(top: BorderSide(width: 2.5, color: colors.darkText)),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: colors.darkText,
      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelColor: colors.darkText.withValues(alpha: .5),
      tabAlignment: TabAlignment.fill,
    ),

    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.primary,
        labelStyle: textStyles.labelTextStyle,
        floatingLabelStyle: textStyles.floatingLabelTextStyle,
        disabledBorder: _defaultInputBorder.copyWith(borderSide: BorderSide(color: colors.darkText)),
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        errorBorder: _defaultInputBorder.copyWith(borderSide: const BorderSide(color: Colors.red)),
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(colors.primary),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 10)),
      ),
    ),
  );

  static final darkTheme = lightTheme;
}
