import 'package:flutter_modular/flutter_modular.dart';

import 'inicializar_app_page.dart';

class InicializarAppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => InicializarAppPage());
  }
}
