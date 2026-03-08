import 'package:flutter/material.dart';

import '../widgets/exams_page.dart';

mixin ExamsTextController on State<ExamsPage> {
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
