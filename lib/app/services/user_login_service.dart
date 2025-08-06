import '../core/exceptions/service_exception.dart';
import '../core/fp/either.dart';
import '../core/fp/unit.dart';

abstract interface class UserLoginService {
  Future<Either<ServiceException, Unit>> execute(String email, String password);
}
