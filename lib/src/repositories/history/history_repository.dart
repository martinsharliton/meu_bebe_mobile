import '../../core/app_database.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';

abstract interface class HistoryRepository {
  Future<Either<RepositoryException, PreviousPregnancy>> getHistory();

  Future<Either<RepositoryException, PreviousPregnancy>> saveHistory(
    PreviousPregnancy history,
  );

  Future<Either<RepositoryException, PreviousPregnancy>> updateHistory(
    PreviousPregnancy history,
  );
}
