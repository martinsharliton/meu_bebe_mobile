import 'package:flutter/material.dart';

import '../../../../core/app_database.dart';
import 'birth_moment_page.dart';

mixin BirthMomentFormController on State<BirthMomentPage> {
  final birthWayEC = TextEditingController();
  final anesthesiaEC = TextEditingController();
  final vaginalCutEC = TextEditingController();
  final preferredPositionEC = TextEditingController();
  final otherPositionEC = TextEditingController();

  void disposeControllers() {
    birthWayEC.dispose();
    anesthesiaEC.dispose();
    vaginalCutEC.dispose();
    preferredPositionEC.dispose();
    otherPositionEC.dispose();
  }

  void initializeForm(BirthMomentData birthMoment) {
    birthWayEC.text = birthMoment.birthWay.index.toString();
    anesthesiaEC.text = birthMoment.anesthesia.index.toString();
    vaginalCutEC.text = birthMoment.vaginalCut.index.toString();
    birthMoment.preferredPosition == null
        ? preferredPositionEC.clear()
        : preferredPositionEC.text =
            birthMoment.preferredPosition!.index.toString();
    birthMoment.otherPosition == null
        ? otherPositionEC.clear()
        : otherPositionEC.text = birthMoment.otherPosition!;
  }
}
