import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class AppointmentsRepository {
  Future<Either<RepositoryException, List<Appointment>>> getAppointments();

  Future<Either<RepositoryException, List<Appointment>>> saveAppointments(
    Appointment appointment,
  );

  Future<Either<RepositoryException, List<Appointment>>> deleteAppointments(
    int id,
  );
}
