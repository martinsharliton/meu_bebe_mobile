import 'package:flutter_getit/flutter_getit.dart';

import '../../../../repositories/current_gestation/current_gestation_repository.dart';
import '../../../../repositories/current_gestation/current_gestation_repository_impl.dart';
import 'current_gestation_controller.dart';
import 'current_gestation_page.dart';

class CurrentGestationRouter extends FlutterGetItModuleRouter {
  CurrentGestationRouter()
    : super(
        name: '/current',
        pages: [
          FlutterGetItPageRouter(
            name: '/current',
            builder: (context) => const CurrentGestationPage(),
          ),
        ],
        bindings: [
          Bind.singleton<CurrentGestationRepository>(
            (i) => CurrentGestationRepositoryImpl(),
          ),
          Bind.singleton((i) => CurrentGestationController(repository: i())),
        ],
      );
}
