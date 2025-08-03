import 'package:flutter_modular/flutter_modular.dart';

import 'formulario_controller.dart';
import 'formulario_page.dart';

class FormularioModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(FormularioController.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const FormularioPage());
  }
}
