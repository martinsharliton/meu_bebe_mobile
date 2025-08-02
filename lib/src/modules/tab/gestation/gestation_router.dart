import 'package:flutter_getit/flutter_getit.dart';

import 'gestation_page.dart';

class GestationRouter extends FlutterGetItModuleRouter {
  GestationRouter()
    : super(
        name: '/initial_gestation',
        pages: [
          FlutterGetItPageRouter(
            name: '/gestation',
            builder: (context) => const GestationPage(),
          ),
        ],
      );
}
