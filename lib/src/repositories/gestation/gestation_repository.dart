import '../../core/app_database.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../model/gestation/pregnant_model.dart';

abstract interface class GestationRepository {
  Future<Either<RepositoryException, PregnantData>> getPregnant();

  Future<Either<RepositoryException, PregnantData>> savePregnant(
    PregnantModel model,
  );

  Future<Either<RepositoryException, PregnantData>> updatePregnant(
    PregnantModel model,
  );
}
