// ignore_for_file: unreachable_switch_default

import 'package:mobx/mobx.dart';

import '../../core/exceptions/failure.dart';
import '../../core/fp/either.dart';
import '../../core/helpers/messages.dart';
import '../../services/user_login_service.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final UserLoginService loginService;

  @observable
  bool obscurePassword = true;

  @observable
  bool logged = false;

  @action
  void passwordToggle() => obscurePassword = !obscurePassword;

  LoginControllerBase(this.loginService);

  @action
  Future<void> login(String email, String password) async {
    final loginResult = await loginService.execute(email, password);

    switch (loginResult) {
      case Left(value: Failure(:final message)):
        Messages.showError(message);
      case Right(value: _):
        logged = true;
      default:
        Messages.showError('Erro ao realizar login');
    }
  }

  @action
  void debug() {
    logged = true;
  }

  void forgotMyPassword() {
    Messages.showInfo('Ainda não implementado');
  }

  void createAccount() {
    Messages.showInfo('Ainda não implementado');
  }
}
