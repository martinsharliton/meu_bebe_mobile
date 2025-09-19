import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class BirthMomentRepository {
  Future<Either<Failure, BirthMomentData>> getBirthMoment();

  Future<Either<Failure, BirthMomentData>> saveBirthMoment(BirthMomentData birthMoment);

  Future<Either<Failure, BirthMomentData>> updateBirthMoment(BirthMomentData birthMoment);
}
