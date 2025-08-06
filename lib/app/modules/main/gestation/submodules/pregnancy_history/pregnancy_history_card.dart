import 'package:flutter/material.dart';

import '../../../widgets/base_card.dart';
import '../../../widgets/item_tile_with_list.dart';

class PregnancyHistoryCard extends StatelessWidget {
  const PregnancyHistoryCard({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ItemTileWithList(
                title: 'Histórico de gestações',
                list: list,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
