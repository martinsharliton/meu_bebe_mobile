import 'package:flutter_getit/flutter_getit.dart';

import '../../../../repositories/vaccines/vaccines_repository.dart';
import '../../../../repositories/vaccines/vaccines_repository_impl.dart';
import 'vaccines_controller.dart';
import 'vaccines_page.dart';

class VaccinesRouter extends FlutterGetItModuleRouter {
  VaccinesRouter()
    : super(
        name: '/vaccines',
        pages: [
          FlutterGetItPageRouter(
            name: '/vaccines',
            builder: (context) => const VaccinesPage(),
          ),
        ],
        bindings: [
          Bind.singleton<VaccinesRepository>((i) => VaccinesRepositoryImpl()),
          Bind.singleton((i) => VaccinesController(repository: i())),
        ],
      );
}
