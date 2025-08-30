import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import 'widgets/information_card.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mais Informações', style: AppTheme.titleSmallStyle),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            InformationCard(
              icon: Icons.girl_outlined,
              title: 'Mudanças no corpo',
              onTap: () {},
            ),
            InformationCard(
              icon: Icons.pregnant_woman,
              title: 'Minha gravidez',
              onTap: () {},
            ),
            InformationCard(
              icon: Icons.watch_later_outlined,
              title: 'Chegou a hora',
              onTap: () {},
            ),
            InformationCard(
              icon: Icons.baby_changing_station,
              title: 'Após o parto',
              onTap: () {},
              spacer: false,
            ),
          ],
        ),
      ),
    );
  }
}
