// import 'package:flutter_modular/flutter_modular.dart';

// import '../../../repositories/expectations/expectations_repository.dart';
// import '../../../repositories/expectations/expectations_repository_impl.dart';
// import '../../../repositories/gestation/gestation_repository.dart';
// import '../../../repositories/gestation/gestation_repository_impl.dart';
// import '../../../repositories/history/history_repository.dart';
// import '../../../repositories/history/history_repository_impl.dart';
// import 'childbirth_page.dart';
// import 'submodules/expectations/expectations_controller.dart';
// import 'submodules/expectations/expectations_page.dart';
// import 'submodules/history/history_controller.dart';
// import 'submodules/history/history_page.dart';
// import 'submodules/identification/identification_controller.dart';
// import 'submodules/identification/identification_page.dart';

// class ChildbirthRouter extends Module {
//   @override
//   void binds(i) {
//     i.addSingleton<HistoryRepository>(() => HistoryRepositoryImpl());
//     i.addSingleton(() => HistoryController(repository: i()));
//     i.addSingleton<ExpectationsRepository>(() => ExpectationsRepositoryImpl());
//     i.addSingleton(() => ExpectationsController(repository: i()));
//     i.addSingleton<GestationRepository>(() => GestationRepositoryImpl());
//     i.addSingleton(() => IdentificationController(repository: i()));
//   }

//   @override
//   void routes(r) {
//     r.child('/', child: (context) => ChildbirthPage());
//     r.child('/history', child: (context) => const HistoryPage());
//     r.child('/expectations', child: (context) => const ExpectationsPage());
//     r.child('/identification', child: (context) => const IdentificationPage());
//   }
// }
