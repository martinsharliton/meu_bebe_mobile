import 'package:flutter_getit/flutter_getit.dart';

import 'information_page.dart';

class InformationRouter extends FlutterGetItModuleRouter {
  InformationRouter()
    : super(
        name: '/information',
        pages: [
          FlutterGetItPageRouter(
            name: '/information',
            builder: (context) => const InformationPage(),
          ),
        ],
      );
}
