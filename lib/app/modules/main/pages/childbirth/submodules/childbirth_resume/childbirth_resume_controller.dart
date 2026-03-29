import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../model/current_pregnancy_data.dart';
import '../../../../../../model/expectation.dart';
import '../../../../../../model/pregnant_data.dart';
import '../../../../../../model/previous_pregnancy.dart';
import '../../../../../../repositories/current_gestation/current_gestation_repository_impl.dart';
import '../../../../../../repositories/expectations/expectations_repository_impl.dart';
import '../../../../../../repositories/gestation/gestation_repository_impl.dart';
import '../../../../../../repositories/history/history_repository_impl.dart';

part 'childbirth_resume_controller.g.dart';

class ChildbirthResumeController = ChildbirthResumeControllerBase with _$ChildbirthResumeController;

abstract class ChildbirthResumeControllerBase with Store {
  @observable
  PregnantData? pregnantData;

  @observable
  PreviousPregnancy? historyData;

  @observable
  CurrentPregnancyData? currentPregnancyData;

  @observable
  Expectation? expectationsData;

  @observable
  bool initialized = false;

  @observable
  bool updated = false;

  @action
  void setUpdated(bool value) => updated = value;

  @action
  Future<void> initialize() async {
    if (!initialized) {
      await getPregnant();
      await getHistory();
      await getCurrentGestation();
      await getExpectations();
    }
  }

  @action
  Future<void> getPregnant() async {
    final repository = GestationRepositoryImpl();
    final result = await repository.getPregnant();

    switch (result) {
      case Error():
        log('Error');
        pregnantData = const PregnantData(id: 0, name: '', birthDate: '', cpf: '');
      case Success():
        pregnantData = result.success;
    }
  }

  @action
  Future<void> getHistory() async {
    final repository = HistoryRepositoryImpl();
    final result = await repository.getHistory();

    switch (result) {
      case Error():
        log('Error');
        historyData = const PreviousPregnancy(
          id: 0,
          abortionsNumber: null,
          givenBirthNumber: null,
          pregnancyNumber: null,
        );
      case Success():
        historyData = result.success;
    }
  }

  @action
  Future<void> getCurrentGestation() async {
    final repository = CurrentGestationRepositoryImpl();
    final result = await repository.getGestation();

    switch (result) {
      case Error():
        log('Error');
        currentPregnancyData = const CurrentPregnancyData(id: 0);
      case Success():
        currentPregnancyData = result.success;
    }
  }

  @action
  Future<void> getExpectations() async {
    final repository = ExpectationsRepositoryImpl();
    final result = await repository.getExpectations();

    switch (result) {
      case Error():
        log('Error');
        expectationsData = const Expectation(
          id: 0,
          companion: Alternatives.yes,
          shaveIntimateHair: Alternatives.yes,
          bowelWashOrSuppository: Alternatives.yes,
          lowLightEnvironment: Alternatives.yes,
          listenToMusic: Alternatives.yes,
          drinkLiquids: Alternatives.yes,
          recordPhotosOrVideos: Alternatives.yes,
        );
      case Success():
        expectationsData = result.success;
    }
  }
}
