import 'package:flutter_getit/flutter_getit.dart';

import '../../../../repositories/medication/medication_repository.dart';
import '../../../../repositories/medication/medication_repository_impl.dart';
import 'medication_controller.dart';
import 'medication_page.dart';

class MedicationRouter extends FlutterGetItModuleRouter {
  MedicationRouter()
    : super(
        name: '/medication',
        pages: [
          FlutterGetItPageRouter(
            name: '/medication',
            builder: (context) => const MedicationPage(),
          ),
        ],
        bindings: [
          Bind.singleton<MedicationRepository>(
            (i) => MedicationRepositoryImpl(),
          ),
          Bind.singleton((i) => MedicationController(repository: i())),
        ],
      );
}
