import 'package:flutter_getit/flutter_getit.dart';

import '../../../../repositories/appointments/appointments_repository.dart';
import '../../../../repositories/appointments/appointments_repository_impl.dart';
import '../../../../repositories/exams/exams_repository.dart';
import '../../../../repositories/exams/exams_repository_impl.dart';
import 'appointments_exams_controller.dart';
import 'appointments_exams_page.dart';

class AppointmentsExamsRouter extends FlutterGetItModuleRouter {
  AppointmentsExamsRouter()
    : super(
        name: '/appointments-exams',
        pages: [
          FlutterGetItPageRouter(
            name: '/',
            builder: (context) => const AppointmentsExamsPage(),
          ),
        ],
        bindings: [
          Bind.singleton<AppointmentsRepository>(
            (i) => AppointmentsRepositoryImpl(),
          ),
          Bind.singleton<ExamsRepository>((i) => ExamsRepositoryImpl()),
          Bind.singleton(
            (i) => AppointmentsExamsController(
              appointmentsRepository: i(),
              examsRepository: i(),
            ),
          ),
        ],
      );
}
