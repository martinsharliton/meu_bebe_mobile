import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class AppointmentsRepository {
  Future<Either<Failure, List<Appointment>>> getAppointments();

  Future<Either<Failure, List<Appointment>>> saveAppointments(Appointment appointment);

  Future<Either<Failure, List<Appointment>>> deleteAppointments(int id);
}
