import 'package:flutter/material.dart';

import '../../../../../../../core/extensions/size_extension.dart';
import '../../../../../../../core/ui/theme/styles/text_styles.dart';

class VaccineInfoDialog extends StatelessWidget {
  final int index;

  const VaccineInfoDialog({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sobre a vacina'),
      content: SizedBox(
        width: context.screenWidth,
        child: Text(_getInfo(index), textAlign: TextAlign.justify, style: context.textStyles.textStyle),
      ),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Voltar'))],
    );
  }

  String _getInfo(int index) {
    if (index >= 0 && index <= 2) {
      return 'Essa vacina protege contra Hepatite B. Pode ser tomada em qualquer tempo do pré-natal, precisando de três doses.';
    }

    if (index >= 3 && index <= 5) {
      return 'Essa vacina protege contra Difteria e Tétano. Pode ser tomada em qualquer tempo do pré-natal, precisando de três doses.';
    }

    if (index == 6) {
      return 'Essa vacina protege contra Difteria, Tétano e Coqueluche. Recomenda-se tomá-la a partir da 20ª semana da gravidez ou o mais breve possível em até 45 dias pós-parto.';
    }

    return '';
  }
}
