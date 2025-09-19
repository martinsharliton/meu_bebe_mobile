import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../database/database.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, UserData>> getUser();

  Future<Either<Failure, UserData>> saveUser(UserData user);

  Future<Either<Failure, UserData>> updateUser(UserData user);
}
