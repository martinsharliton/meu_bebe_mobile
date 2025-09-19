import '../core/exceptions/failure.dart';
import '../core/fp/either.dart';
import '../core/fp/unit.dart';

abstract interface class UserLoginService {
  Future<Either<Failure, Unit>> execute(String email, String password);
}
