import 'package:flutter/material.dart';

import '../../../../../../model/pregnant_data.dart';
import '../../../../../../model/user_data.dart';
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

  @override
  void initState() {
    super.initState();
  }

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
      birthdayEC.text = pregnant.birthDate ?? '';
      cpfEC.text = pregnant.cpf ?? '';
      nationalHealthCardEC.text = pregnant.nationalHealthCard ?? '';
      prenatalPlaceEC.text = pregnant.prenatalPlace ?? '';
    }
    if (profile != null) {
      emailEC.text = profile.email ?? '';
    }
  }
}
