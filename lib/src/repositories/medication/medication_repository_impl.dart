import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/app_database.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import './medication_repository.dart';

class MedicationRepositoryImpl implements MedicationRepository {
  final db = Modular.get<AppDatabase>();

  @override
  Future<Either<RepositoryException, List<Medication>>> getMedications() async {
    try {
      final medications = await db.select(db.medications).get();
      return Right(medications);
    } catch (e) {
      return Left(RepositoryException());
    }
  }

  @override
  Future<Either<RepositoryException, List<Medication>>> saveMedication(
    Medication medication,
  ) async {
    try {
      await db
          .into(db.medications)
          .insert(
            MedicationsCompanion(
              name: Value(medication.name),
              dose: Value(medication.dose),
              medicationTime: Value(medication.medicationTime),
            ),
          );
      final saved = await db.select(db.medications).get();
      return Right(saved);
    } catch (e) {
      log(e.toString());
      return Left(RepositoryException());
    }
  }

  @override
  Future<Either<RepositoryException, List<Medication>>> deleteMedication(
    int id,
  ) async {
    try {
      await (db.delete(
        db.medications,
      )..where((medication) => medication.id.equals(id))).go();

      final list = await db.select(db.medications).get();
      return Right(list);
    } catch (e) {
      log(e.toString());
      return Left(RepositoryException());
    }
  }
}
