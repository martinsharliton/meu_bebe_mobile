import 'package:flutter/material.dart';

import 'colors_app.dart';

class TextStyles {
  static TextStyles? _instance;
  // Avoid self isntance
  TextStyles._();
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  static final colors = ColorsApp.instance;

  TextStyle get titleStyle {
    return TextStyle(fontFamily: 'Cabin', color: colors.darkText, fontSize: 32, fontWeight: FontWeight.w900);
  }

  TextStyle get titleSmallStyle {
    return TextStyle(fontFamily: 'Cabin', color: colors.darkText, fontSize: 24, fontWeight: FontWeight.w900);
  }

  TextStyle get subTitleStyle {
    return TextStyle(fontFamily: 'Cabin', color: colors.darkText, fontSize: 18, fontWeight: FontWeight.w500);
  }

  TextStyle get textStyle {
    return TextStyle(fontFamily: 'Cabin', color: colors.text, fontSize: 16);
  }

  TextStyle get bodySmall {
    return TextStyle(fontFamily: 'Cabin', color: colors.text, fontSize: 14);
  }

  TextStyle get caption {
    return TextStyle(fontFamily: 'Cabin', color: colors.text, fontSize: 12);
  }

  TextStyle get labelTextStyle {
    return TextStyle(fontFamily: 'Cabin', fontSize: 14, color: colors.text, fontWeight: FontWeight.w700);
  }

  TextStyle get floatingLabelTextStyle {
    return TextStyle(fontFamily: 'Cabin', color: colors.darkText, fontWeight: FontWeight.w600);
  }

  TextStyle get buttonTextStyle {
    return TextStyle(fontSize: 14, fontFamily: 'Cabin', fontWeight: FontWeight.w700);
  }
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
