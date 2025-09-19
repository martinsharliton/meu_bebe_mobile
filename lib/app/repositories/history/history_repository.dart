import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class HistoryRepository {
  Future<Either<Failure, PreviousPregnancy>> getHistory();

  Future<Either<Failure, PreviousPregnancy>> saveHistory(PreviousPregnancy history);

  Future<Either<Failure, PreviousPregnancy>> updateHistory(PreviousPregnancy history);
}
