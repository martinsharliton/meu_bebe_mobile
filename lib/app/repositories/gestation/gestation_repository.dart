import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';
import '../../model/gestation/pregnant_model.dart';

abstract interface class GestationRepository {
  Future<Either<Failure, PregnantData>> getPregnant();

  Future<Either<Failure, PregnantData>> savePregnant(PregnantModel model);

  Future<Either<Failure, PregnantData>> updatePregnant(PregnantModel model);
}
