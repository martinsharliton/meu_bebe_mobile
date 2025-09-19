import 'package:flutter/material.dart';

import '../../../core/extensions/size_extension.dart';
import '../../../core/theme/app_theme.dart';
import 'submodules/baby_data/baby_data_card.dart';
import 'submodules/maternity/maternity_card.dart';
import 'submodules/pregnancy_history/pregnancy_history_card.dart';
import 'submodules/pregnant/pregnant_card.dart';
import 'submodules/prenatal_appointment/prenatal_appointment_card.dart';

class GestationPage extends StatefulWidget {
  const GestationPage({super.key});

  @override
  State<GestationPage> createState() => _GestationPageState();
}

class _GestationPageState extends State<GestationPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      color: AppTheme.secondaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            PregnantCard(),
            MaternityCard(),
            PrenatalAppointmentCard(list: ['20/12/2025', '22/12/2025', '23/12/2025', '24/12/2025']),
            BabyDataCard(list: ['Luan Henrique Cardoso', 'Fernanda Silva', 'Laura Santos']),
            PregnancyHistoryCard(list: ['01/05/2023']),
          ],
        ),
      ),
    );
  }
}
