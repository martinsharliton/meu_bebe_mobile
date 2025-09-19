import 'package:signals_flutter/signals_core.dart';

import '../../core/fp/either.dart';
import '../../core/helpers/messages.dart';
import '../../repositories/gestation/gestation_repository.dart';

class MainController {
  final GestationRepository gestationRepository;

  MainController(this.gestationRepository);

  final _name = signal<String>('');
  String get name => _name();

  final tabName = signal<String>('Home');
  void setTabName(String name) => tabName.value = name;

  Future<void> initialize() async {
    final result = await gestationRepository.getPregnant();

    switch (result) {
      case Left():
        Messages.showError('Falha ao buscar nome de usuário');
      case Right(value: final pregnant):
        _name.value = pregnant.name;
    }
  }
}
