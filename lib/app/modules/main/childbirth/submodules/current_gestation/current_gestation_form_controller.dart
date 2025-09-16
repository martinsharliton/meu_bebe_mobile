import 'package:flutter/material.dart';

import '../../../../../database/database.dart';
import 'current_gestation_page.dart';

mixin CurrentGestationFormController on State<CurrentGestationPage> {
  final lastMenstrualPeriodEC = TextEditingController();
  final firstUltrasoundEC = TextEditingController();

  void disposeControllers() {
    lastMenstrualPeriodEC.dispose();
    firstUltrasoundEC.dispose();
  }

  void initializeForm(CurrentPregnancyData? current) {
    if (current != null) {
      lastMenstrualPeriodEC.text = current.lastMenstrualPeriod ?? '';
      firstUltrasoundEC.text = current.firstUltrasound ?? '';
    }
  }
}
