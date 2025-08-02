import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../widgets/base_card.dart';
import '../../widgets/custom_item_tile.dart';

class DesiresExpectationsCard extends StatelessWidget {
  const DesiresExpectationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        children: [
          const Text(
            'Outros desejos e expectativas',
            style: AppTheme.titleSmallStyle,
          ),
          const SizedBox(height: 16),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomItemTile(flex: 1, title: '', content: 'Nenhum outro'),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Editar'),
            ),
          ),
        ],
      ),
    );
  }
}
