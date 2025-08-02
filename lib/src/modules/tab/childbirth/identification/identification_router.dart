import 'package:flutter_getit/flutter_getit.dart';

import 'identification_controller.dart';
import 'identification_page.dart';

class IdentificationRouter extends FlutterGetItModuleRouter {
  IdentificationRouter()
    : super(
        name: '/identification',
        pages: [
          FlutterGetItPageRouter(
            name: '/identification',
            builder: (context) => const IdentificationPage(),
          ),
        ],
        bindings: [
          Bind.singleton((i) => IdentificationController(repository: i())),
        ],
      );
}
