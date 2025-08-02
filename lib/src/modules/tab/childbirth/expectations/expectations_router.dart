import 'package:flutter_getit/flutter_getit.dart';

import '../../../../repositories/expectations/expectations_repository.dart';
import '../../../../repositories/expectations/expectations_repository_impl.dart';
import 'expectations_controller.dart';
import 'expectations_page.dart';

class ExpectationsRouter extends FlutterGetItModuleRouter {
  ExpectationsRouter()
    : super(
        name: '/expectations',
        pages: [
          FlutterGetItPageRouter(
            name: '/expectations',
            builder: (context) => const ExpectationsPage(),
          ),
        ],
        bindings: [
          Bind.singleton<ExpectationsRepository>(
            (i) => ExpectationsRepositoryImpl(),
          ),
          Bind.singleton((i) => ExpectationsController(repository: i())),
        ],
      );
}
