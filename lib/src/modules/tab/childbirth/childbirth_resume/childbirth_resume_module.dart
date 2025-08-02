import 'package:flutter_getit/flutter_getit.dart';

import '../../../../repositories/current_gestation/current_gestation_repository.dart';
import '../../../../repositories/current_gestation/current_gestation_repository_impl.dart';
import '../../../../repositories/expectations/expectations_repository.dart';
import '../../../../repositories/expectations/expectations_repository_impl.dart';
import '../../../../repositories/history/history_repository.dart';
import '../../../../repositories/history/history_repository_impl.dart';
import 'childbirth_resume_controller.dart';
import 'childbirth_resume_page.dart';

class ChildbirthResumeModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/resume';

  @override
  List<Bind<Object>> get bindings => [
    Bind.singleton<HistoryRepository>((i) => HistoryRepositoryImpl()),
    Bind.singleton<CurrentGestationRepository>(
      (i) => CurrentGestationRepositoryImpl(),
    ),
    Bind.singleton<ExpectationsRepository>((i) => ExpectationsRepositoryImpl()),
    Bind.singleton((i) => ChildbirthResumeController()),
  ];

  @override
  List<FlutterGetItPageRouter> get pages => [
    FlutterGetItPageRouter(
      name: '/',
      builder: (_) => const ChildbirthResumePage(),
    ),
  ];
}
