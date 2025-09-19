// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:signals_flutter/signals_flutter.dart';

import '../../../../../core/fp/either.dart';
import '../../../../../core/helpers/messages.dart';
import '../../../../../database/database.dart';
import '../../../../../model/gestation/pregnant_model.dart';
import '../../../../../repositories/gestation/gestation_repository.dart';
import '../../../../../repositories/profile/profile_repository.dart';

class ProfileDataController {
  final GestationRepository gestationRepository;
  final ProfileRepository profileRepository;

  ProfileDataController(this.profileRepository, this.gestationRepository);

  PregnantData? _pregnant;
  PregnantData? get pregnant => _pregnant;

  UserData? _user;
  UserData? get user => _user;

  final _formEnabled = signal<bool>(false);
  bool get formEnabled => _formEnabled();

  void setFormEnabled(bool enabled) {
    _formEnabled.value = enabled;
  }

  Future<void> initialize() async {
    await getGestationElements();
    await getUserElements();
  }

  Future<void> getGestationElements() async {
    final result = await gestationRepository.getPregnant();

    switch (result) {
      case Left():
        log('Falha ao buscar dados');
      case Right(value: final gestation):
        _pregnant = gestation;
    }
  }

  Future<void> getUserElements() async {
    final result = await profileRepository.getUser();

    switch (result) {
      case Left():
        log('Falha ao buscar dados');
      case Right(value: final user):
        _user = user;
    }
  }

  Future<bool> saveProfile(PregnantModel pregnant, UserData user) async {
    final List<bool> hasError = [false, false];
    hasError[0] = await _saveGestation(pregnant);
    hasError[1] = await _saveUser(user);
    if (hasError[0] || hasError[1]) {
      Messages.showError('Falha ao salvar os dados');
      return false;
    } else {
      Messages.showSuccess('Dados salvos');
      return true;
    }
  }

  Future<bool> _saveGestation(PregnantModel pregnant) async {
    final result = await gestationRepository.updatePregnant(pregnant);

    switch (result) {
      case Left():
        return true;
      case Right():
        return false;
    }
  }

  Future<bool> _saveUser(UserData user) async {
    final result = await profileRepository.updateUser(user);

    switch (result) {
      case Left():
        return true;
      case Right():
        return false;
    }
  }

  /// Importante: liberar signals
  void dispose() {
    _formEnabled.dispose();
  }
}
