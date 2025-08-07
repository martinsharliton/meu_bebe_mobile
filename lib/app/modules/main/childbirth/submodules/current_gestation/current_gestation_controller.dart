import 'package:signals_flutter/signals_core.dart';

import '../../../../../core/app_database.dart';
import '../../../../../core/fp/either.dart';
import '../../../../../core/helpers/messages.dart';
import '../../../../../repositories/current_gestation/current_gestation_repository.dart';

class CurrentGestationController with MessageStateMixin {
  final CurrentGestationRepository repository;

  CurrentGestationController(this.repository);

  final _saved = signal<bool>(false);
  bool get saved => _saved();

  CurrentPregnancyData? _model;
  CurrentPregnancyData? get model => _model;

  Future<void> initialize() async {
    final result = await repository.getGestation();

    switch (result) {
      case Left():
        showError('Erro ao pegar os dados da gravidez atual');
      case Right(value: final current):
        _model = current;
    }

    _model ??= const CurrentPregnancyData(id: 0);
  }

  Future<void> saveGestation(CurrentPregnancyData current) async {
    final result = await repository.updateGestation(current);

    switch (result) {
      case Left():
        showError('Erro ao salvar os dados');
      case Right(value: final updated):
        _model = updated;
        _saved.value = true;
    }
  }
}
