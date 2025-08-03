import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../repositories/current_gestation/current_gestation_repository.dart';
import '../../../../../repositories/current_gestation/current_gestation_repository_impl.dart';
import 'current_gestation_controller.dart';
import 'current_gestation_page.dart';

class CurrentGestationRouter extends Module {
  @override
  void binds(i) {
    i.addSingleton<CurrentGestationRepository>(
      () => CurrentGestationRepositoryImpl(),
    );
    i.addSingleton(() => CurrentGestationController(repository: i()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const CurrentGestationPage());
  }
}
