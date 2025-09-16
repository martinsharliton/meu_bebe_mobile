import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class ExamsRepository {
  Future<Either<RepositoryException, List<Exam>>> getExams();

  Future<Either<RepositoryException, List<Exam>>> saveExams(Exam exam);

  Future<Either<RepositoryException, List<Exam>>> deleteExams(int id);
}
