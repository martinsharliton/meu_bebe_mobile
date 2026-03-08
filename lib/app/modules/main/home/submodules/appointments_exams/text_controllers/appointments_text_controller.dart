import 'package:flutter/material.dart';

import '../widgets/appointments_page.dart';

mixin AppointmentsTextController on State<AppointmentsPage> {
  late final TextEditingController nameEC;
  late final TextEditingController dateEC;
  late final TextEditingController descriptionEC;

  @override
  void initState() {
    super.initState();
    nameEC = TextEditingController();
    dateEC = TextEditingController();
    descriptionEC = TextEditingController();
  }

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
