import '../../core/app_database.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';

abstract interface class AppointmentsRepository {
  Future<Either<RepositoryException, List<Appointment>>> getAppointments();

  Future<Either<RepositoryException, List<Appointment>>> saveAppointments(
    Appointment appointment,
  );

  Future<Either<RepositoryException, List<Appointment>>> deleteAppointments(
    int id,
  );
}
