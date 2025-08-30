import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../profile_data_controller.dart';

class CustomDropDown extends StatelessWidget {
  final ProfileDataController controller;
  final String label;
  final TextEditingController textController;
  final int type; // 0 = Estado Civil, 1 = Escolaridade, 2 = Renda

  const CustomDropDown({
    super.key,
    required this.label,
    required this.textController,
    required this.type,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppTheme.secondaryColor,
        border: controller.formEnabled
            ? null
            : Border.all(color: AppTheme.darkTextColor),
      ),
      child: DropdownMenu<int>(
        enabled: controller.formEnabled,
        initialSelection: int.tryParse(textController.text),
        expandedInsets: EdgeInsets.zero,
        textStyle: AppTheme.textStyle,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: AppTheme.textStyle,
          border: null,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        menuStyle: MenuStyle(
          backgroundColor: const WidgetStatePropertyAll(
            AppTheme.secondaryColor,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
        label: textController.text.isEmpty
            ? Text(label)
            : Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [.5, .5],
                    colors: [Colors.white, AppTheme.secondaryColor],
                  ),
                ),
                child: Text(label),
              ),
        onSelected: (value) {
          textController.text = value.toString();
        },
        dropdownMenuEntries: _chooseDropList(type),
      ),
    );
  }

  List<DropdownMenuEntry<int>> _chooseDropList(int index) {
    switch (index) {
      case 0:
        return _maritalStatusEntries();
      case 1:
        return _educationEntries();
      case 2:
        return _incomeEntries();
      default:
        return [];
    }
  }

  List<DropdownMenuEntry<int>> _maritalStatusEntries() {
    return const [
      DropdownMenuEntry(value: 0, label: 'Solteira'),
      DropdownMenuEntry(value: 1, label: 'Casada'),
      DropdownMenuEntry(value: 2, label: 'Divorciada'),
      DropdownMenuEntry(value: 3, label: 'Viúva'),
      DropdownMenuEntry(value: 4, label: 'União estável'),
    ];
  }

  List<DropdownMenuEntry<int>> _educationEntries() {
    return const [
      DropdownMenuEntry(value: 0, label: 'Ensino fundamental incompleto'),
      DropdownMenuEntry(value: 1, label: 'Ensino fundamental completo'),
      DropdownMenuEntry(value: 2, label: 'Ensino médio incompleto'),
      DropdownMenuEntry(value: 3, label: 'Ensino médio completo'),
      DropdownMenuEntry(value: 4, label: 'Ensino superior incompleta'),
      DropdownMenuEntry(value: 5, label: 'Ensino superior completa'),
      DropdownMenuEntry(value: 6, label: 'Superior a graduação'),
    ];
  }

  List<DropdownMenuEntry<int>> _incomeEntries() {
    return const [
      DropdownMenuEntry(value: 0, label: 'Até 1 salário mínimo'),
      DropdownMenuEntry(value: 1, label: 'Entre 1 e 2 salários mínimos'),
      DropdownMenuEntry(value: 2, label: 'Entre 2 e 3 salários mínimos'),
      DropdownMenuEntry(value: 3, label: 'Entre 3 e 5 salários mínimos'),
      DropdownMenuEntry(value: 4, label: 'Entre 5 e 10 salários mínimos'),
      DropdownMenuEntry(value: 5, label: 'Acima de 10 salários mínimos'),
    ];
  }
}
