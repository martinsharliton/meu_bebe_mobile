// ignore_for_file: unreachable_switch_default

import 'package:signals_flutter/signals_core.dart';

import '../../core/exceptions/service_exception.dart';
import '../../core/fp/either.dart';
import '../../core/helpers/messages.dart';
import '../../services/user_login_service.dart';

class LoginController with MessageStateMixin {
  final UserLoginService loginService;

  LoginController(this.loginService);

  final _obscurePassword = signal(true);
  final _logged = signal(false);

  bool get obscurePassword => _obscurePassword();
  bool get logged => _logged();

  void passwordToggle() => _obscurePassword.value = !_obscurePassword.value;

  Future<void> login(String email, String password) async {
    final loginResult = await loginService.execute(email, password);

    switch (loginResult) {
      case Left(value: ServiceException(:final message)):
        showError(message);
      case Right(value: _):
        _logged.value = true;
      default:
        showError('Erro ao realizar login');
    }
  }

  void debug() {
    _logged.value = true;
  }

  void forgotMyPassword() {
    showInfo('Ainda não implementado');
  }

  void createAccount() {
    showInfo('Ainda não implementado');
  }
}
