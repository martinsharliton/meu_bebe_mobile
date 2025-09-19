import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';
import 'history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final db = Modular.get<Database>();

  @override
  Future<Either<Failure, PreviousPregnancy>> getHistory() async {
    try {
      final history = await (db.select(db.previousPregnancies)..where((p) => p.id.equals(1))).getSingle();
      return Right(history);
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, PreviousPregnancy>> saveHistory(PreviousPregnancy history) async {
    try {
      await db
          .into(db.previousPregnancies)
          .insert(
            PreviousPregnanciesCompanion(
              pregnancyNumber: Value(history.pregnancyNumber),
              givenBirthNumber: Value(history.givenBirthNumber),
              abortionsNumber: Value(history.abortionsNumber),
            ),
          );
      final saved = await (db.select(db.previousPregnancies)..where((p) => p.id.equals(1))).getSingle();
      return Right(saved);
    } catch (e) {
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, PreviousPregnancy>> updateHistory(PreviousPregnancy history) async {
    try {
      await (db.update(db.previousPregnancies)..where((p) => p.id.equals(1))).write(
        PreviousPregnanciesCompanion(
          pregnancyNumber: Value(history.pregnancyNumber),
          givenBirthNumber: Value(history.givenBirthNumber),
          abortionsNumber: Value(history.abortionsNumber),
        ),
      );
      final updated = await (db.select(db.previousPregnancies)..where((p) => p.id.equals(1))).getSingle();
      return Right(updated);
    } catch (e) {
      if (e.toString().contains('No element')) {
        return saveHistory(history);
      }
      return Left(Failure());
    }
  }
}
