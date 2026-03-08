import 'package:flutter/material.dart';

import 'medication_dialog.dart';

mixin MedicationTextController on State<MedicationDialog> {
  late final TextEditingController nameEC;
  late final TextEditingController doseEC;
  late final TextEditingController medicationTimeEC;

  @override
  void initState() {
    super.initState();
    nameEC = TextEditingController();
    doseEC = TextEditingController();
    medicationTimeEC = TextEditingController();
  }

  void disposeControllers() {
    nameEC.dispose();
    doseEC.dispose();
    medicationTimeEC.dispose();
  }

  void clearControllers() {
    nameEC.clear();
    doseEC.clear();
    medicationTimeEC.clear();
  }
}
