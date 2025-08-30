import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../profile_data_controller.dart';

class CustomTextField extends StatelessWidget {
  final ProfileDataController controller;
  final TextEditingController textController;
  final String label;
  final FormFieldValidator<String?>? validator;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.textController,
    required this.label,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: controller.formEnabled
          ? null
          : const TextStyle(color: AppTheme.textColor),
      enabled: controller.formEnabled,
      validator: validator,
      decoration: InputDecoration(label: Text(label)),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
    );
  }
}
