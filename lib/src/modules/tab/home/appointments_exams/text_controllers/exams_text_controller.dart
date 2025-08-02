import 'package:flutter/material.dart';

import '../widgets/exams_page.dart';

mixin ExamsTextController on State<ExamsPage> {
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
