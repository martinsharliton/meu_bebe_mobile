import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../app_module.dart';
import '../../../../core/theme/app_theme.dart';
import '../../widgets/base_card.dart';

class UpdateChildbirthCard extends StatelessWidget {
  const UpdateChildbirthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        spacing: 10,
        children: [
          const Text(
            'Atualize seu plano de parto',
            style: AppTheme.titleSmallStyle,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildButton('Identificação', () {
                Modular.to.pushNamed(routeIndetificacao);
              }),
              const SizedBox(width: 10),
              _buildButton('História', () {
                Modular.to.pushNamed(routeHistoria);
              }),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildButton('Gravidez atual', () {
                Modular.to.pushNamed(routeGravidezAtual);
              }),
              const SizedBox(width: 10),
              _buildButton('Expectativas', () {
                Modular.to.pushNamed(routeExpectativa);
              }),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildButton('Parto', () {}),
              const SizedBox(width: 10),
              _buildButton('Alívio da dor', () {}),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildButton('Nascimento', () {}),
              const SizedBox(width: 10),
              _buildButton('Observações', () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String title, VoidCallback onPressed) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: ElevatedButton(onPressed: onPressed, child: Text(title)),
      ),
    );
  }
}
