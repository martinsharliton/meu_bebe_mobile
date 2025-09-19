import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class VaccinesRepository {
  Future<Either<Failure, List<VaccineData>>> getVaccines();

  Future<Either<Failure, List<VaccineData>>> saveVaccine(VaccineData vaccine);

  Future<Either<Failure, List<VaccineData>>> updateVaccine(VaccineData vaccine);
}
