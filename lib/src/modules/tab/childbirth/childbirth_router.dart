import 'package:flutter_getit/flutter_getit.dart';

import 'childbirth_page.dart';
import 'history/history_page.dart';
import 'expectations/expectations_page.dart';
import 'identification/identification_page.dart';
import 'history/history_controller.dart';
import 'expectations/expectations_controller.dart';
import 'identification/identification_controller.dart';
import '../../../repositories/history/history_repository.dart';
import '../../../repositories/history/history_repository_impl.dart';
import '../../../repositories/expectations/expectations_repository.dart';
import '../../../repositories/expectations/expectations_repository_impl.dart';
import '../../../repositories/gestation/gestation_repository.dart';
import '../../../repositories/gestation/gestation_repository_impl.dart';

class ChildbirthRouter extends FlutterGetItModuleRouter {
  ChildbirthRouter()
    : super(
        name: '/initial_more',
        pages: [
          FlutterGetItPageRouter(
            name: '/more',
            builder: (context) => ChildbirthPage(),
          ),
          FlutterGetItPageRouter(
            name: '/history',
            builder: (context) => const HistoryPage(),
          ),
          FlutterGetItPageRouter(
            name: '/expectations',
            builder: (context) => const ExpectationsPage(),
          ),
          FlutterGetItPageRouter(
            name: '/identification',
            builder: (context) => const IdentificationPage(),
          ),
        ],
        bindings: [
          Bind.singleton<HistoryRepository>((i) => HistoryRepositoryImpl()),
          Bind.singleton((i) => HistoryController(repository: i())),
          Bind.singleton<ExpectationsRepository>((i) => ExpectationsRepositoryImpl()),
          Bind.singleton((i) => ExpectationsController(repository: i())),
          Bind.singleton<GestationRepository>((i) => GestationRepositoryImpl()),
          Bind.singleton((i) => IdentificationController(repository: i())),
        ],
      );
}
