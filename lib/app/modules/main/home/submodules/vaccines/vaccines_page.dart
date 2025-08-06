import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../../../core/theme/app_theme.dart';
import 'vaccines_controller.dart';
import 'widgets/vaccine_card.dart';

class VaccinesPage extends StatefulWidget {
  const VaccinesPage({super.key});

  @override
  State<VaccinesPage> createState() => _VaccinesPageState();
}

class _VaccinesPageState extends State<VaccinesPage> {
  final controller = Modular.get<VaccinesController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Minhas Vacinas',
                style: AppTheme.titleSmallStyle,
              ),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                // Corpo principal
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Watch((context) {
                    if (controller.vaccines.isEmpty) {
                      return const Center(
                        child: Text(
                          'Carregando as vacinas',
                          style: AppTheme.subTitleStyle,
                        ),
                      );
                    }

                    return Visibility(
                      visible: !controller.updated,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 16),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Qualquer tempo',
                                style: AppTheme.titleSmallStyle,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Column(
                              children: controller.vaccines
                                  .where((vaccine) {
                                    return vaccine.id <
                                        controller.vaccines.length - 1;
                                  })
                                  .map(
                                    (vaccine) => VaccineCard(
                                      used: vaccine.used,
                                      onChanged: () {
                                        controller.updateVaccine(
                                          vaccine.copyWith(used: !vaccine.used),
                                        );
                                      },
                                      index: vaccine.id,
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(height: 32),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                '20ª semana de gravidez até 45 dias após o parto',
                                textAlign: TextAlign.center,
                                style: AppTheme.titleSmallStyle,
                              ),
                            ),
                            const SizedBox(height: 10),
                            VaccineCard(
                              used: controller.vaccines.last.used,
                              onChanged: () {
                                controller.updateVaccine(
                                  controller.vaccines.last.copyWith(
                                    used: !controller.vaccines.last.used,
                                  ),
                                );
                              },
                              index: controller.vaccines.last.id,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),

                // Watch para resetar o sinal de updated
                Watch((context) {
                  if (controller.updated == true) {
                    controller.resetUpdated();
                  }
                  return const SizedBox.shrink(); // não exibe nada
                }),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
