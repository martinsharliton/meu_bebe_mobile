import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class CurrentGestationRepository {
  Future<Either<Failure, CurrentPregnancyData>> getGestation();

  Future<Either<Failure, CurrentPregnancyData>> saveGestation(CurrentPregnancyData current);

  Future<Either<Failure, CurrentPregnancyData>> updateGestation(CurrentPregnancyData current);
}
