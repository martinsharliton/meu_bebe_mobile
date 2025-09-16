import 'dart:developer';

import 'package:signals_flutter/signals_core.dart';

import '../../../../../core/fp/either.dart';
import '../../../../../core/helpers/messages.dart';
import '../../../../../database/database.dart';
import '../../../../../model/birth_plan/expectations_model.dart';
import '../../../../../repositories/expectations/expectations_repository.dart';

class ExpectationsController with MessageStateMixin {
  final ExpectationsRepository repository;

  ExpectationsController(this.repository);

  final _saved = signal<bool>(false);
  bool get saved => _saved();

  Expectation? _expectations;
  Expectation? get expectation => _expectations;

  Future<void> initialize() async {
    final result = await repository.getExpectations();

    switch (result) {
      case Left():
        showError('Erro ao pegar dados das expectativas');
      case Right(value: final expectations):
        _expectations = expectations;
    }

    _expectations ??= const Expectation(
      id: 0,
      companion: Alternatives.no,
      shaveIntimateHair: Alternatives.no,
      bowelWashOrSuppository: Alternatives.no,
      lowLightEnvironment: Alternatives.no,
      listenToMusic: Alternatives.no,
      drinkLiquids: Alternatives.no,
      recordPhotosOrVideos: Alternatives.no,
    );
    log('teste');
  }

  Future<void> saveExpectations(Expectation expectations) async {
    final result = await repository.updateExpectations(expectations);

    switch (result) {
      case Left():
        showError('Erro ao salvar dados');
      case Right(value: final updated):
        showSuccess('Dados salvos com sucesso');
        _expectations = updated;
        _saved.value = true;
    }
  }
}
