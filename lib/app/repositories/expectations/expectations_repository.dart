import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class ExpectationsRepository {
  Future<Either<RepositoryException, Expectation>> getExpectations();

  Future<Either<RepositoryException, Expectation>> saveExpectations(
    Expectation expectations,
  );

  Future<Either<RepositoryException, Expectation>> updateExpectations(
    Expectation expectations,
  );
}
