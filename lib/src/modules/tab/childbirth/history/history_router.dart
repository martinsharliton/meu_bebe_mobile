import 'package:flutter_getit/flutter_getit.dart';

import '../../../../repositories/history/history_repository.dart';
import '../../../../repositories/history/history_repository_impl.dart';
import 'history_controller.dart';
import 'history_page.dart';

class HistoryRouter extends FlutterGetItModuleRouter {
  HistoryRouter()
    : super(
        name: '/history',
        pages: [
          FlutterGetItPageRouter(
            name: '/history',
            builder: (context) => const HistoryPage(),
          ),
        ],
        bindings: [
          Bind.singleton<HistoryRepository>((i) => HistoryRepositoryImpl()),
          Bind.singleton((i) => HistoryController(repository: i())),
        ],
      );
}
