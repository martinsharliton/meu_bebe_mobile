import 'package:flutter_modular/flutter_modular.dart';

import 'information_page.dart';

class InformationModule extends Module {
  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const InformationPage());
  }
}
