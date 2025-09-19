import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class ExamsRepository {
  Future<Either<Failure, List<Exam>>> getExams();

  Future<Either<Failure, List<Exam>>> saveExams(Exam exam);

  Future<Either<Failure, List<Exam>>> deleteExams(int id);
}
