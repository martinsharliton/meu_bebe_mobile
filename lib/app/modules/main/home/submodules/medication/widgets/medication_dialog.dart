import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../../../core/extensions/size_extension.dart';
import '../../../../../../core/theme/app_theme.dart';
import '../../../../../../database/database.dart';
import '../medication_controller.dart';
import 'custom_text_form_field.dart';

class MedicationDialog extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final MedicationController controller;

  const MedicationDialog({
    super.key,
    required this.formKey,
    required this.controller,
  });

  @override
  State<MedicationDialog> createState() => _MedicationDialogState();
}

class _MedicationDialogState extends State<MedicationDialog> {
  final nameEC = TextEditingController();
  final doseEC = TextEditingController();
  final medicationTimeEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    doseEC.dispose();
    medicationTimeEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Adicionar medicamento',
        style: AppTheme.titleSmallStyle,
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        width: context.screenWidth,
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              controller: nameEC,
              label: 'Nome do medicamento',
              validator: Validatorless.required('Nome obrigatório'),
            ),
            CustomTextFormField(
              controller: medicationTimeEC,
              label: 'Tempo do medicamento (ex.: 6 em 6 horas)',
              validator: Validatorless.required('Tempo obrigatório'),
            ),

            CustomTextFormField(
              controller: doseEC,
              label: 'Dose do medicamento',
              validator: Validatorless.required('Dose obrigatória'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar', style: AppTheme.subTitleStyle),
        ),
        TextButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            final valid = widget.formKey.currentState?.validate() ?? false;
            if (valid) {
              widget.controller.saveMedication(
                Medication(
                  id: 0,
                  name: nameEC.text,
                  dose: doseEC.text,
                  medicationTime: medicationTimeEC.text,
                ),
              );
              clearControllers();
              Modular.to.pop();
            }
          },
          child: const Text('Salvar', style: AppTheme.subTitleStyle),
        ),
      ],
    );
  }

  void clearControllers() {
    nameEC.clear();
    doseEC.clear();
    medicationTimeEC.clear();
  }
}
