import '../../core/app_database.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';

abstract interface class CurrentGestationRepository {
  Future<Either<RepositoryException, CurrentPregnancyData>> getGestation();

  Future<Either<RepositoryException, CurrentPregnancyData>> saveGestation(
    CurrentPregnancyData current,
  );

  Future<Either<RepositoryException, CurrentPregnancyData>> updateGestation(
    CurrentPregnancyData current,
  );
}
