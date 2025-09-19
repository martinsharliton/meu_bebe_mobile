import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class ExpectationsRepository {
  Future<Either<Failure, Expectation>> getExpectations();

  Future<Either<Failure, Expectation>> saveExpectations(Expectation expectations);

  Future<Either<Failure, Expectation>> updateExpectations(Expectation expectations);
}
