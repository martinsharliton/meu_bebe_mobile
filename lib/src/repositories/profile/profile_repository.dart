import '../../core/app_database.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';

abstract interface class ProfileRepository {
  Future<Either<RepositoryException, UserData>> getUser();

  Future<Either<RepositoryException, UserData>> saveUser(UserData user);

  Future<Either<RepositoryException, UserData>> updateUser(UserData user);
}
