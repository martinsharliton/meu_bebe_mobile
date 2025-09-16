import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class MedicationRepository {
  Future<Either<RepositoryException, List<Medication>>> getMedications();

  Future<Either<RepositoryException, List<Medication>>> saveMedication(
    Medication medication,
  );

  Future<Either<RepositoryException, List<Medication>>> deleteMedication(
    int id,
  );
}
