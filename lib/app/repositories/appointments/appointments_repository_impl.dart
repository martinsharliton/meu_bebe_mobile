import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';
import 'appointments_repository.dart';

class AppointmentsRepositoryImpl implements AppointmentsRepository {
  final db = Modular.get<Database>();

  @override
  Future<Either<RepositoryException, List<Appointment>>>
  getAppointments() async {
    try {
      final appointments = await db.select(db.appointments).get();
      return Right(appointments);
    } catch (e) {
      return Left(RepositoryException());
    }
  }

  @override
  Future<Either<RepositoryException, List<Appointment>>> saveAppointments(
    Appointment appointment,
  ) async {
    try {
      log(db.appointments.actualTableName);
      await db
          .into(db.appointments)
          .insert(
            AppointmentsCompanion(
              title: Value(appointment.title),
              appointmentDate: Value(appointment.appointmentDate),
              description: Value(appointment.description),
            ),
          );
      final saved = await db.select(db.appointments).get();
      return Right(saved);
    } catch (e) {
      log(e.toString());
      return Left(RepositoryException());
    }
  }

  @override
  Future<Either<RepositoryException, List<Appointment>>> deleteAppointments(
    int id,
  ) async {
    try {
      await (db.delete(
        db.appointments,
      )..where((appointment) => appointment.id.equals(id))).go();

      final list = await db.select(db.appointments).get();
      return Right(list);
    } catch (e) {
      log(e.toString());
      return Left(RepositoryException());
    }
  }
}
