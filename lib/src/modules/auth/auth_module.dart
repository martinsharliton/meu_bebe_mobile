import 'package:flutter_getit/flutter_getit.dart';

import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';
import 'formulario/formulario_router.dart';
import 'login/login_router.dart';

class AuthModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/auth';

  @override
  List<Bind<Object>> get bindings => [
    Bind.singleton<UserRepository>((i) => UserRepositoryImpl(restClient: i())),
  ];

  @override
  List<FlutterGetItModuleRouter> get pages => [
    LoginRouter(),
    FormularioRouter(),
  ];
}
