import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../core/helpers/messages.dart';
import '../../../../../model/vaccine_data.dart';
import '../../../../../repositories/vaccines/vaccines_repository_impl.dart';

part 'vaccines_controller.g.dart';

class VaccinesController = VaccinesControllerBase with _$VaccinesController;

abstract class VaccinesControllerBase with Store {
  final VaccinesRepositoryImpl repository;

  @observable
  var vaccines = ObservableList<VaccineData>();

  @observable
  bool updated = false;

  @action
  void resetUpdated() => updated = false;

  Future<void> initialize() async {
    await getVaccines();
  }

  VaccinesControllerBase(this.repository);

  @action
  Future<void> getVaccines() async {
    final result = await repository.getVaccines();

    switch (result) {
      case Success():
        if (result.success.isEmpty) return _setVaccines();

        vaccines.clear();
        vaccines.addAll(vaccines);
        _sortVaccines();
        return;
      case Error():
        Messages.showError(result.error.message);
    }
  }

  Future<void> _saveVaccine(VaccineData vaccine) async {
    final result = await repository.saveVaccine(vaccine: vaccine);

    switch (result) {
      case Success():
        log('Vacina ${result.success.name} salva');
      case Error(error: final failure):
        Messages.showError(failure.message);
    }
  }

  @action
  Future<void> _setVaccines() async {
    await _saveVaccine(const VaccineData(id: 0, name: 'HB_1', used: false));
    await _saveVaccine(const VaccineData(id: 1, name: 'HB_2', used: false));
    await _saveVaccine(const VaccineData(id: 2, name: 'HB_3', used: false));
    await _saveVaccine(const VaccineData(id: 3, name: 'dT_1', used: false));
    await _saveVaccine(const VaccineData(id: 4, name: 'dT_2', used: false));
    await _saveVaccine(const VaccineData(id: 5, name: 'dT_3', used: false));
    await _saveVaccine(const VaccineData(id: 6, name: 'dTpa', used: false));
    await getVaccines();
    updated = true;
  }

  @action
  Future<void> updateVaccine(VaccineData vaccine) async {
    final result = await repository.saveVaccine(vaccine: vaccine);

    switch (result) {
      case Success():
        final updatedVaccine = result.success;
        final index = vaccines.indexWhere((v) => v.id == updatedVaccine.id);
        if (index != -1) {
          vaccines[index] = updatedVaccine;
        }
        _sortVaccines();
        updated = true;
      case Error(error: final failure):
        Messages.showError(failure.message);
    }
  }

  @action
  void _sortVaccines() {
    vaccines.sort((a, b) => a.id.compareTo(b.id));
  }

  @observable
  bool _checkHepatitis1 = false;

  @computed
  bool get checkHepatitis1 => _checkHepatitis1;

  @observable
  bool _checkHepatitis2 = false;

  @computed
  bool get checkHepatitis2 => _checkHepatitis2;

  @observable
  bool _checkHepatitis3 = false;

  @computed
  bool get checkHepatitis3 => _checkHepatitis3;

  @observable
  bool _checkDT1 = false;

  @computed
  bool get checkDT1 => _checkDT1;

  @observable
  bool _checkDT2 = false;

  @computed
  bool get checkDT2 => _checkDT2;

  @observable
  bool _checkDT3 = false;

  @computed
  bool get checkDT3 => _checkDT3;

  @observable
  bool _checkDTpa = false;

  @computed
  bool get checkDTpa => _checkDTpa;

  @action
  void setCheck(bool checked, int index) {
    switch (index) {
      case 0:
        _checkHepatitis1 = checked;
        break;
      case 1:
        _checkHepatitis2 = checked;
        break;
      case 2:
        _checkHepatitis3 = checked;
        break;
      case 3:
        _checkDT1 = checked;
        break;
      case 4:
        _checkDT2 = checked;
        break;
      case 5:
        _checkDT3 = checked;
        break;
      case 6:
        _checkDTpa = checked;
        break;
    }
  }
}
