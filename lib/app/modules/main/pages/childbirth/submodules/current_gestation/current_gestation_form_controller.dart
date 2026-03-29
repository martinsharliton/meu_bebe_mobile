import 'package:flutter/material.dart';

import '../../../../../../model/current_pregnancy_data.dart';
import 'current_gestation_page.dart';

mixin CurrentGestationFormController on State<CurrentGestationPage> {
  late final TextEditingController lastMenstrualPeriodEC;
  late final TextEditingController firstUltrasoundEC;

  @override
  void initState() {
    super.initState();
    lastMenstrualPeriodEC = TextEditingController();
    firstUltrasoundEC = TextEditingController();
  }

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
