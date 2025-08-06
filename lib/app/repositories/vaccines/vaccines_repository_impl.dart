import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/app_database.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import 'vaccines_repository.dart';

class VaccinesRepositoryImpl implements VaccinesRepository {
  final db = Modular.get<AppDatabase>();

  @override
  Future<Either<RepositoryException, List<VaccineData>>> getVaccines() async {
    try {
      final vaccines = await db.select(db.vaccine).get();
      return Right(vaccines);
    } catch (e) {
      log(e.toString());
      return Left(RepositoryException(message: e.toString()));
    }
  }

  @override
  Future<Either<RepositoryException, List<VaccineData>>> saveVaccine(
    VaccineData vaccine,
  ) async {
    try {
      await db
          .into(db.vaccine)
          .insert(
            VaccineCompanion(
              id: Value(vaccine.id),
              name: Value(vaccine.name),
              used: Value(vaccine.used),
            ),
          );

      final vaccines = await db.select(db.vaccine).get();
      return Right(vaccines);
    } catch (e) {
      log(e.toString());
      return Left(RepositoryException());
    }
  }

  @override
  Future<Either<RepositoryException, List<VaccineData>>> updateVaccine(
    VaccineData vaccine,
  ) async {
    try {
      await (db.update(
        db.vaccine,
      )..where((v) => v.id.equals(vaccine.id))).write(
        VaccineCompanion(name: Value(vaccine.name), used: Value(vaccine.used)),
      );

      final vaccines = await db.select(db.vaccine).get();
      return Right(vaccines);
    } catch (e) {
      log(e.toString());
      return Left(RepositoryException());
    }
  }
}
