import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';

import '../model/birth_plan/birth_model.dart';
import '../model/birth_plan/birth_moment_model.dart';
import '../model/birth_plan/current_pregnancy_model.dart';
import '../model/birth_plan/expectations_model.dart';
import '../model/birth_plan/observations_model.dart';
import '../model/birth_plan/pain_relief_model.dart';
import '../model/birth_plan/previous_pregnancies_model.dart';
import '../model/gestation/baby_data_model.dart';
import '../model/gestation/maternity_model.dart';
import '../model/gestation/pregnant_model.dart';
import '../model/gestation/prenatal_appointment_model.dart';
import '../model/home/appointments_model.dart';
import '../model/home/exams_model.dart';
import '../model/home/medications_model.dart';
import '../model/home/vaccine_model.dart';
import '../model/user/user_model.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Birth,
    BirthMoment,
    CurrentPregnancy,
    Expectations,
    Observations,
    PainRelief,
    PreviousPregnancies,
    BabyData,
    Maternity,
    Pregnant,
    PrenatalAppointment,
    User,
    Appointments,
    Exams,
    Medications,
    Vaccine,
  ],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  static QueryExecutor _openConnection() {
    return SqfliteQueryExecutor.inDatabaseFolder(path: 'db.sqlite');
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      await m.createAll();
    },
  );

  @override
  int get schemaVersion => 3;
}
