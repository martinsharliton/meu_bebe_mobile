import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../../../core/helpers/messages.dart';
import '../../../../../core/theme/app_theme.dart';
import 'medication_controller.dart';
import 'widgets/medication_dialog.dart';
import 'widgets/medicine_card.dart';

class MedicationPage extends StatefulWidget {
  const MedicationPage({super.key});

  @override
  State<MedicationPage> createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> with MessageViewMixin {
  final controller = Modular.get<MedicationController>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    messageListener(controller);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      effect(() {
        if (controller.updated == true) {
          controller.resetUpdated();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(appBar: _buildAppBar, body: _buildBody);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  AppBar get _buildAppBar => AppBar(
    title: const Text('Meus Medicamentos', style: AppTheme.titleSmallStyle),
    centerTitle: true,
  );

  Widget get _buildBody => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: Watch(
      (_) => Visibility(
        visible: !controller.updated,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => openAddMedicationDilaog(),
                child: const Text('Adicionar medicamento'),
              ),
            ),
            const SizedBox(height: 16),
            controller.medication.isNotEmpty
                ? Expanded(
                    child: ListView(
                      children: controller.medication
                          .map(
                            (medication) => MedicineCard(
                              name: medication.name,
                              dose: medication.dose,
                              medicineTime: medication.medicationTime,
                              onTap: () {
                                controller.deleteMedication(medication.id);
                              },
                            ),
                          )
                          .toList(),
                    ),
                  )
                : const Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Text('Não foram encontrados medicamentos'),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    ),
  );

  void openAddMedicationDilaog() {
    showDialog(
      context: context,
      builder: (context) => Form(
        key: formKey,
        child: MedicationDialog(formKey: formKey, controller: controller),
      ),
    );
  }
}
