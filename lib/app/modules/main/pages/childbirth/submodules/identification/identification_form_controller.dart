import 'package:flutter/material.dart';

import '../../../../../../model/pregnant_data.dart';
import 'identification_page.dart';

mixin IdentificationFormController on State<IdentificationPage> {
  late final TextEditingController nameEC;
  late final TextEditingController socialNameEC;
  late final TextEditingController birthdayEC;
  late final TextEditingController cpfEC;
  late final TextEditingController nationalHealthCardEC;
  late final TextEditingController prenatalPlaceEC;
  late final TextEditingController profissionalEC;
  late final TextEditingController prenatalPlaceContactEC;

  @override
  void initState() {
    super.initState();
    nameEC = TextEditingController();
    socialNameEC = TextEditingController();
    birthdayEC = TextEditingController();
    cpfEC = TextEditingController();
    nationalHealthCardEC = TextEditingController();
    prenatalPlaceEC = TextEditingController();
    profissionalEC = TextEditingController();
    prenatalPlaceContactEC = TextEditingController();
  }

  void disposeControllers() {
    nameEC.dispose();
    socialNameEC.dispose();
    birthdayEC.dispose();
    cpfEC.dispose();
    nationalHealthCardEC.dispose();
    prenatalPlaceEC.dispose();
    profissionalEC.dispose();
    prenatalPlaceContactEC.dispose();
  }

  void initializeForm(final PregnantData? model) {
    if (model != null) {
      nameEC.text = model.name;
      socialNameEC.text = model.socialName ?? '';
      birthdayEC.text = model.birthDate ?? '';
      cpfEC.text = model.cpf ?? '';
      nationalHealthCardEC.text = model.nationalHealthCard ?? '';
      prenatalPlaceEC.text = model.prenatalPlace ?? '';
      profissionalEC.text = model.professionalName ?? '';
      prenatalPlaceContactEC.text = model.prenatalPlaceContact ?? '';
    }
  }

  PregnantData updatePregnant(PregnantData model) {
    return model.copyWith(
      name: nameEC.text,
      socialName: socialNameEC.text,
      birthDate: birthdayEC.text,
      cpf: cpfEC.text,
      nationalHealthCard: nationalHealthCardEC.text,
      prenatalPlace: prenatalPlaceEC.text,
      professionalName: profissionalEC.text,
      prenatalPlaceContact: prenatalPlaceContactEC.text,
    );
  }
}
