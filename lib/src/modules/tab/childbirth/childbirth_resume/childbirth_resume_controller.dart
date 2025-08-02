import 'dart:developer';

import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../../core/app_database.dart';
import '../../../../core/fp/either.dart';
import '../../../../model/birth_plan/expectations_model.dart';
import '../../../../repositories/current_gestation/current_gestation_repository.dart';
import '../../../../repositories/expectations/expectations_repository.dart';
import '../../../../repositories/gestation/gestation_repository.dart';
import '../../../../repositories/history/history_repository.dart';

class ChildbirthResumeController {
  PregnantData? pregnantData;
  PreviousPregnancy? historyData;
  CurrentPregnancyData? currentPregnancyData;
  Expectation? expectationsData;
  bool initialized = false;

  final _updated = signal<bool>(false);
  bool get updated => _updated();
  void setUpdated(bool value) => _updated.value = value;

  Future<void> initialize() async {
    if (!initialized) {
      await getPregnant();
      await getHistory();
      await getCurrentGestation();
      await getExpectations();
    }
  }

  Future<void> getPregnant() async {
    final result = await Injector.get<GestationRepository>().getPregnant();

    switch (result) {
      case Left():
        log('Error');
        pregnantData = const PregnantData(
          id: 0,
          name: '',
          birthDate: '',
          cpf: '',
        );
      case Right(value: final pregnant):
        pregnantData = pregnant;
    }
  }

  Future<void> getHistory() async {
    final result = await Injector.get<HistoryRepository>().getHistory();

    switch (result) {
      case Left():
        log('Error');
        historyData = const PreviousPregnancy(
          id: 0,
          abortionsNumber: null,
          givenBirthNumber: null,
          pregnancyNumber: null,
        );
      case Right(value: final history):
        historyData = history;
    }
  }

  Future<void> getCurrentGestation() async {
    final result = await Injector.get<CurrentGestationRepository>()
        .getGestation();

    switch (result) {
      case Left():
        log('Error');
        currentPregnancyData = const CurrentPregnancyData(id: 0);
      case Right(value: final current):
        currentPregnancyData = current;
    }
  }

  Future<void> getExpectations() async {
    final result = await Injector.get<ExpectationsRepository>()
        .getExpectations();

    switch (result) {
      case Left():
        log('Error');
        expectationsData = Expectation(
          id: 0,
          companion: Alternatives.values[1],
          shaveIntimateHair: Alternatives.values[1],
          bowelWashOrSuppository: Alternatives.values[1],
          lowLightEnvironment: Alternatives.values[1],
          listenToMusic: Alternatives.values[1],
          drinkLiquids: Alternatives.values[1],
          recordPhotosOrVideos: Alternatives.values[1],
        );
      case Right(value: final expectations):
        expectationsData = expectations;
    }
  }
}
