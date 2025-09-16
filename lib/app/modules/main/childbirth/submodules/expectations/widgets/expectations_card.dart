import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../../../../../../database/database.dart';
import '../../../../../../model/birth_plan/expectations_model.dart';
import '../../../../widgets/base_card.dart';
import '../../../../widgets/custom_item_tile.dart';

class ExpectationsCard extends StatelessWidget {
  const ExpectationsCard({super.key, required this.expectations});

  final Expectation? expectations;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        children: [
          const Text('Expectativas gerais', style: AppTheme.titleSmallStyle),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomItemTile(
                flex: 1,
                title: 'Acompanhante',
                content: _getData(expectations!.companion),
              ),
              const SizedBox(width: 10),
              CustomItemTile(
                flex: 1,
                title: 'Raspagem de pelos íntimos',
                content: _getData(expectations!.shaveIntimateHair),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomItemTile(
                flex: 1,
                title: 'Lavagem instestinal',
                content: _getData(expectations!.bowelWashOrSuppository),
              ),
              const SizedBox(width: 10),
              CustomItemTile(
                flex: 1,
                title: 'Pouca luminosidade',
                content: _getData(expectations!.lowLightEnvironment),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomItemTile(
                flex: 1,
                title: 'Música',
                content: _getData(expectations!.listenToMusic),
              ),
              const SizedBox(width: 10),
              CustomItemTile(
                flex: 1,
                title: 'Beber líquidos',
                content: _getData(expectations!.drinkLiquids),
              ),
              const SizedBox(width: 10),
              CustomItemTile(
                flex: 1,
                title: 'Fotos e Filmagens',
                content: _getData(expectations!.recordPhotosOrVideos),
              ),
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

  String _getData(Alternatives alternative) {
    switch (alternative) {
      case Alternatives.yes:
        return 'Sim';
      case Alternatives.no:
        return 'Não';
      case Alternatives.dontKnow:
        return 'Não sei';
    }
  }
}
