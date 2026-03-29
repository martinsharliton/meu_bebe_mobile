import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../repositories/appointments/appointments_repository_sqlite.dart';
import '../../../../../../repositories/exams/exams_repository_sqlite.dart';
import 'appointments_exams_controller.dart';
import 'appointments_exams_page.dart';

class AppointmentsExamsModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(AppointmentsRepositoryImpl.new);
    i.addSingleton(ExamsRepositoryImpl.new);
    i.addSingleton(AppointmentsExamsController.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const AppointmentsExamsPage());
  }
}
