import 'package:flutter/material.dart';

import '../widgets/appointments_page.dart';

mixin AppointmentsTextController on State<AppointmentsPage> {
  final nameEC = TextEditingController();
  final dateEC = TextEditingController();
  final descriptionEC = TextEditingController();

  void disposeControllers() {
    nameEC.dispose();
    dateEC.dispose();
    descriptionEC.dispose();
  }

  void clearControllers() {
    nameEC.clear();
    dateEC.clear();
    descriptionEC.clear();
  }
}
