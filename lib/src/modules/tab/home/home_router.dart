import 'package:flutter_getit/flutter_getit.dart';

import '../../../repositories/medication/medication_repository.dart';
import '../../../repositories/medication/medication_repository_impl.dart';
import '../../../repositories/vaccines/vaccines_repository.dart';
import '../../../repositories/vaccines/vaccines_repository_impl.dart';
import '../tab_page.dart';
import 'medication/medication_controller.dart';
import 'vaccines/vaccines_controller.dart';

class HomeRouter extends FlutterGetItModuleRouter {
  HomeRouter()
    : super(
        name: '/initial_homes',
        pages: [
          FlutterGetItPageRouter(
            name: '/',
            builder: (context) => const TabPage(),
          ),
          // FlutterGetItPageRouter(
          //   name: '/homes',
          //   builder: (context) => const HomePage(),
          // ),
          // FlutterGetItPageRouter(
          //   name: '/vaccines',
          //   builder: (context) => const VaccinesPage(),
          // ),
          // FlutterGetItPageRouter(
          //   name: '/medication',
          //   builder: (context) => const MedicationPage(),
          // ),
          // FlutterGetItPageRouter(
          //   name: '/information',
          //   builder: (context) => const InformationPage(),
          // ),
          // FlutterGetItPageRouter(
          //   name: '/appointments_exams',
          //   builder: (context) => const AppointmentsExamsPage(),
          // ),
        ],
        bindings: [
          Bind.singleton<VaccinesRepository>((i) => VaccinesRepositoryImpl()),
          Bind.singleton((i) => VaccinesController(repository: i())),
          Bind.singleton<MedicationRepository>(
            (i) => MedicationRepositoryImpl(),
          ),
          Bind.singleton((i) => MedicationController(repository: i())),
        ],
      );
}
