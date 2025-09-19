import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class MedicationRepository {
  Future<Either<Failure, List<Medication>>> getMedications();

  Future<Either<Failure, List<Medication>>> saveMedication(Medication medication);

  Future<Either<Failure, List<Medication>>> deleteMedication(int id);
}
