import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../repositories/history/history_repository.dart';
import '../../../../../repositories/history/history_repository_impl.dart';
import 'history_controller.dart';
import 'history_page.dart';

class HistoryRouter extends Module {
  @override
  void binds(i) {
    i.addSingleton<HistoryRepository>(() => HistoryRepositoryImpl());
    i.addSingleton(() => HistoryController(repository: i()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HistoryPage());
  }
}
