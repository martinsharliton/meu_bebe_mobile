import 'package:flutter/material.dart';

import '../../../../../../core/ui/theme/styles/text_styles.dart';
import '../../../../widgets/base_card.dart';
import '../../../../widgets/custom_item_tile.dart';

class DesiresExpectationsCard extends StatelessWidget {
  const DesiresExpectationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        children: [
          Text('Outros desejos e expectativas', style: context.textStyles.titleSmallStyle),
          const SizedBox(height: 16),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [CustomItemTile(flex: 1, title: '', content: 'Nenhum outro')],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(onPressed: () {}, child: const Text('Editar')),
          ),
        ],
      ),
    );
  }
}
