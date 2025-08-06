import 'package:flutter_modular/flutter_modular.dart';

import 'identification_controller.dart';
import 'identification_page.dart';

class IdentificationRouter extends Module {
  @override
  void binds(i) {
    i.addSingleton(() => IdentificationController(repository: i()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const IdentificationPage());
  }
}
