import 'package:flutter_getit/flutter_getit.dart';

import '../../../services/user_login_service.dart';
import '../../../services/user_login_service_impl.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginRouter extends FlutterGetItModuleRouter {
  LoginRouter()
    : super(
        name: '/initial_login',
        pages: [
          FlutterGetItPageRouter(
            name: '/login',
            builder: (context) => const LoginPage(),
          ),
        ],
        bindings: [
          Bind.singleton<UserLoginService>(
            (i) => UserLoginServiceImpl(userRepository: i()),
          ),
          Bind.singleton((i) => LoginController(loginService: i())),
        ],
      );
}
