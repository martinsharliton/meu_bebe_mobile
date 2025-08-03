import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_module.dart';
import '../../../core/extensions/size_extension.dart';
import '../../../core/helpers/messages.dart';
import '../../../core/theme/app_theme.dart';
import 'widgets/home_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MessageViewMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      color: AppTheme.secondaryColor,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeCard(
            icon: Icons.assignment_add,
            title: 'Consultas e exames',
            onTap: () {
              Modular.to.pushNamed(routeConsultasExames);
            },
          ),
          HomeCard(
            icon: Icons.vaccines,
            title: 'Minhas vacinas',
            onTap: () {
              Modular.to.pushNamed(routeVacinas);
            },
          ),
          HomeCard(
            icon: Icons.medication_outlined,
            title: 'Meus medicamentos',
            onTap: () {
              Modular.to.pushNamed(routeMedicacoes);
            },
          ),
          HomeCard(
            icon: Icons.info_outline,
            title: 'Informações básicas',
            onTap: () {
              Modular.to.pushNamed(routeInformacoes);
            },
          ),
        ],
      ),
    );
  }
}
