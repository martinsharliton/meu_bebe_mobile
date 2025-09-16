import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class VaccinesRepository {
  Future<Either<RepositoryException, List<VaccineData>>> getVaccines();

  Future<Either<RepositoryException, List<VaccineData>>> saveVaccine(
    VaccineData vaccine,
  );

  Future<Either<RepositoryException, List<VaccineData>>> updateVaccine(
    VaccineData vaccine,
  );
}
