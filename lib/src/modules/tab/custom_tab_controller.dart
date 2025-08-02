// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:signals_flutter/signals_core.dart';

import '../../core/fp/either.dart';
import '../../core/helpers/messages.dart';
import '../../repositories/gestation/gestation_repository.dart';

class CustomTabController with MessageStateMixin {
  final GestationRepository _gestationRepository;

  CustomTabController({required GestationRepository gestationRepository})
    : _gestationRepository = gestationRepository;

  final _name = signal<String>('');
  String get name => _name();

  Future<void> initialize() async {
    final result = await _gestationRepository.getPregnant();

    switch (result) {
      case Left():
        showError('Falha ao buscar nome de usuário');
      case Right(value: final pregnant):
        _name.value = pregnant.name;
    }
  }
}
