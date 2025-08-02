import 'package:flutter/material.dart';

import '../../../core/extensions/size_extension.dart';
import '../../../core/theme/app_theme.dart';
import 'baby_data/baby_data_card.dart';
import 'maternity/maternity_card.dart';
import 'pregnancy_history/pregnancy_history_card.dart';
import 'pregnant/pregnant_card.dart';
import 'prenatal_appointment/prenatal_appointment_card.dart';

class GestationPage extends StatefulWidget {
  const GestationPage({super.key});

  @override
  State<GestationPage> createState() => _GestationPageState();
}

class _GestationPageState extends State<GestationPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return _content;
  }

  Widget get _content => Container(
    width: context.screenWidth,
    padding: const EdgeInsets.all(10),
    color: AppTheme.secondaryColor,
    child: const SingleChildScrollView(
      child: Column(
        children: [
          PregnantCard(),
          SizedBox(height: 16),
          MaternityCard(),
          SizedBox(height: 16),
          PrenatalAppointmentCard(
            list: ['20/12/2021', '22/12/2021', '23/12/2021', '24/12/2021'],
          ),
          SizedBox(height: 16),
          BabyDataCard(
            list: ['Luan Henrique Cardoso', 'Fernanda Silva', 'Laura Santos'],
          ),
          SizedBox(height: 16),
          PregnancyHistoryCard(list: ['01/05/2019']),
        ],
      ),
    ),
  );
}
