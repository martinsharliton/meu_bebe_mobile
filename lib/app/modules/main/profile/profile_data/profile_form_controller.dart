import 'package:flutter/material.dart';

import '../../../../core/app_database.dart';
import 'profile_data_page.dart';

mixin ProfileFormController on State<ProfileDataPage> {
  final nameEC = TextEditingController();
  final socialNameEC = TextEditingController();
  final birthdayEC = TextEditingController();
  final cpfEC = TextEditingController();
  final nationalHealthCardEC = TextEditingController();
  final prenatalPlaceEC = TextEditingController();
  final emailEC = TextEditingController();
  final maritalStatusEC = TextEditingController();
  final incomeEC = TextEditingController();
  final educationEC = TextEditingController();

  void disposeControllers() {
    nameEC.dispose();
    socialNameEC.dispose();
    birthdayEC.dispose();
    cpfEC.dispose();
    nationalHealthCardEC.dispose();
    prenatalPlaceEC.dispose();
    emailEC.dispose();
    maritalStatusEC.dispose();
    incomeEC.dispose();
    educationEC.dispose();
  }

  void initializeForm(final PregnantData? pregnant, final UserData? profile) {
    if (pregnant != null) {
      nameEC.text = pregnant.name;
      socialNameEC.text = pregnant.socialName ?? '';
      birthdayEC.text = pregnant.birthDate.toString();
      cpfEC.text = pregnant.cpf;
      nationalHealthCardEC.text = pregnant.nationalHealthCardNumber ?? '';
      prenatalPlaceEC.text = pregnant.preNatalPlace ?? '';
    }
    if (profile != null) {
      emailEC.text = profile.email;
    }
  }
}
