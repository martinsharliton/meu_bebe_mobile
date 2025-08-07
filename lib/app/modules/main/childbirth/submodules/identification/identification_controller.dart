import 'package:signals_flutter/signals_core.dart';

import '../../../../../core/fp/either.dart';
import '../../../../../core/helpers/messages.dart';
import '../../../../../model/gestation/pregnant_model.dart';
import '../../../../../repositories/gestation/gestation_repository.dart';

class IdentificationController with MessageStateMixin {
  final GestationRepository repository;

  IdentificationController(this.repository);

  final _saved = signal<bool>(false);
  bool get saved => _saved();

  PregnantModel? _model;
  PregnantModel? get model => _model;

  Future<void> initialize() async {
    final result = await repository.getPregnant();

    switch (result) {
      case Left():
        showError('Erro ao pegar dados da gestante');
      case Right(value: final pregnant):
        _model = PregnantModel.fromData(pregnant);
    }

    _model ??= PregnantModel(
      name: '',
      socialName: '',
      birthDate: '',
      cpf: '',
      nationalHealthCardNumber: '',
      preNatalPlace: '',
      profissionalName: '',
      prenatalPlaceContact: '',
    );
  }

  Future<void> saveIdentification(PregnantModel model) async {
    final result = await repository.updatePregnant(model);

    switch (result) {
      case Left():
        showError('Erro ao salvar os dados');
      case Right(value: final pregnant):
        showSuccess('Dados salvos com sucesso');
        _model = PregnantModel.fromData(pregnant);
        _saved.value = true;
    }
  }
}
