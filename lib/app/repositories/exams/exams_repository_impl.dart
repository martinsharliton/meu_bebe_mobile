import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';
import 'exams_repository.dart';

class ExamsRepositoryImpl implements ExamsRepository {
  final db = Modular.get<Database>();

  @override
  Future<Either<Failure, List<Exam>>> getExams() async {
    try {
      final exams = await db.select(db.exams).get();
      return Right(exams);
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Exam>>> saveExams(Exam exam) async {
    try {
      log(db.exams.actualTableName);
      await db
          .into(db.exams)
          .insert(
            ExamsCompanion(
              title: Value(exam.title),
              examDate: Value(exam.examDate),
              description: Value(exam.description),
            ),
          );
      final saved = await db.select(db.exams).get();
      return Right(saved);
    } catch (e) {
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Exam>>> deleteExams(int id) async {
    try {
      await (db.delete(db.exams)..where((exam) => exam.id.equals(id))).go();

      final list = await db.select(db.exams).get();
      return Right(list);
    } catch (e) {
      log(e.toString());
      return Left(Failure());
    }
  }
}
