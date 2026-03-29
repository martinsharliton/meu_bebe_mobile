import 'package:flutter/material.dart';

import '../../../../../../core/ui/theme/styles/colors_app.dart';
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
      backgroundColor: context.colors.secondary,
      appBar: AppBar(title: Text('Mais Informações'), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          spacing: 10,
          crossAxisAlignment: .center,
          children: [
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: InformationCard(icon: Icons.girl_outlined, title: 'Mudanças no corpo', onTap: () {}),
                ),
                Expanded(
                  child: InformationCard(icon: Icons.pregnant_woman, title: 'Minha gravidez', onTap: () {}),
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: InformationCard(icon: Icons.watch_later_outlined, title: 'Chegou a hora', onTap: () {}),
                ),
                Expanded(
                  child: InformationCard(icon: Icons.baby_changing_station, title: 'Após o parto', onTap: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
