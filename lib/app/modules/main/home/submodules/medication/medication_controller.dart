import 'package:signals_flutter/signals_core.dart';

import '../../../../../core/app_database.dart';
import '../../../../../core/fp/either.dart';
import '../../../../../core/helpers/messages.dart';
import '../../../../../repositories/medication/medication_repository.dart';

class MedicationController with MessageStateMixin {
  final MedicationRepository repository;

  MedicationController(this.repository);

  final List<Medication> _medications = [];
  List<Medication> get medication => _medications;

  final _updated = signal<bool>(false);
  bool get updated => _updated();
  void resetUpdated() => _updated.value = false;

  Future<void> initialize() async {
    await _getMedications();
  }

  Future<void> _getMedications() async {
    final result = await repository.getMedications();

    switch (result) {
      case Left():
        showError('Falha ao buscar as medicações');
      case Right(value: final medications):
        _medications.clear();
        _medications.addAll(medications);
        _sortMedications();
    }
  }

  Future<void> saveMedication(Medication medication) async {
    final result = await repository.saveMedication(medication);

    switch (result) {
      case Left():
        showError('Falha ao salvar o medicamento');
      case Right(value: final medication):
        _medications.clear();
        _medications.addAll(medication);
        _sortMedications();
        _updated.value = true;
        showSuccess('Medicamento salvo');
    }
  }

  Future<void> deleteMedication(int id) async {
    final result = await repository.deleteMedication(id);

    switch (result) {
      case Left():
        showError('Falha ao remover o medicamento');
      case Right(value: final medication):
        _medications.clear();
        _medications.addAll(medication);
        _sortMedications();
        _updated.value = true;
        showSuccess('Medicamento deletado');
    }
  }

  void _sortMedications() {
    _medications.sort((a, b) {
      return a.name.compareTo(b.name);
    });
  }
}
