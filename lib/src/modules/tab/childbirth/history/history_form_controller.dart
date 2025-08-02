import 'package:flutter/material.dart';

import '../../../../core/app_database.dart';
import 'history_page.dart';

mixin HistoryFormController on State<HistoryPage> {
  final pregnantNumberEC = TextEditingController();
  final childbirthNumberEC = TextEditingController();
  final abortionNumberEC = TextEditingController();

  void disposeControllers() {
    pregnantNumberEC.dispose();
    childbirthNumberEC.dispose();
    abortionNumberEC.dispose();
  }

  void initializeForm(PreviousPregnancy history) {
    history.pregnancyNumber == null
        ? pregnantNumberEC.clear()
        : pregnantNumberEC.text = history.pregnancyNumber.toString();
    history.givenBirthNumber == null
        ? childbirthNumberEC.clear()
        : childbirthNumberEC.text = history.givenBirthNumber.toString();
    history.abortionsNumber == null
        ? abortionNumberEC.clear()
        : abortionNumberEC.text = history.abortionsNumber.toString();
  }
}
