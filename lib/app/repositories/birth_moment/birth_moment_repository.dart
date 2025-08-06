import '../../core/app_database.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';

abstract interface class BirthMomentRepository {
  Future<Either<RepositoryException, BirthMomentData>> getBirthMoment();

  Future<Either<RepositoryException, BirthMomentData>> saveBirthMoment(
    BirthMomentData birthMoment,
  );

  Future<Either<RepositoryException, BirthMomentData>> updateBirthMoment(
    BirthMomentData birthMoment,
  );
}
