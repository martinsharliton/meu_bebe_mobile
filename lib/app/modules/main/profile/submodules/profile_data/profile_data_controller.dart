import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../core/helpers/messages.dart';
import '../../../../../model/pregnant_data.dart';
import '../../../../../model/user_data.dart';
import '../../../../../repositories/gestation/gestation_repository_impl.dart';
import '../../../../../repositories/profile/profile_repository_impl.dart';

part 'profile_data_controller.g.dart';

class ProfileDataController = ProfileDataControllerBase with _$ProfileDataController;

abstract class ProfileDataControllerBase with Store {
  final GestationRepositoryImpl gestationRepository;
  final ProfileRepositoryImpl profileRepository;

  ProfileDataControllerBase(this.gestationRepository, this.profileRepository);

  @observable
  PregnantData? pregnant;

  @observable
  UserData? user;

  @observable
  bool formEnabled = false;

  @action
  void setFormEnabled(bool enabled) {
    formEnabled = enabled;
  }

  Future<void> initialize() async {
    await getGestationElements();
    await getUserElements();
  }

  @action
  Future<void> getGestationElements() async {
    final result = await gestationRepository.getPregnant();

    switch (result) {
      case Error():
        log('Falha ao buscar dados');
      case Success():
        pregnant = result.success;
    }
  }

  @action
  Future<void> getUserElements() async {
    final result = await profileRepository.getUser();

    switch (result) {
      case Error():
        log('Falha ao buscar dados');
      case Success():
        user = result.success;
    }
  }

  Future<bool> saveProfile(PregnantData pregnant, UserData user) async {
    final hasSucessGestacion = await _saveGestation(pregnant);
    final hasSucessUser = await _saveUser(user);

    log('G: $hasSucessGestacion');
    log('U: $hasSucessUser');

    if (hasSucessGestacion && hasSucessUser) {
      Messages.showSuccess('Dados salvos');
      Modular.to.pop();
      return true;
    } else {
      Messages.showError('Falha ao salvar os dados');
      return false;
    }
  }

  Future<bool> _saveGestation(PregnantData pregnant) async {
    final result = await gestationRepository.updatePregnant(pregnant: pregnant);

    switch (result) {
      case Success():
        log('${result.success.name} salvo');
        return true;
      case Error():
        log(result.error.message);
        return false;
    }
  }

  Future<bool> _saveUser(UserData user) async {
    final result = await profileRepository.updateUser(user: user);

    switch (result) {
      case Success():
        log(result.success.name);

        return true;
      case Error():
        log(result.error.message);
        return false;
    }
  }
}
