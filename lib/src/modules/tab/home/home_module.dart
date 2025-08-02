import 'package:flutter_getit/flutter_getit.dart';

import 'appointments_exams/appointments_exams_router.dart';
import 'information/information_router.dart';
import 'medication/medication_router.dart';
import 'vaccines/vaccines_router.dart';

class HomeModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/home';

  @override
  List<FlutterGetItModuleRouter> get pages => [
    AppointmentsExamsRouter(),
    VaccinesRouter(),
    InformationRouter(),
    MedicationRouter(),
  ];
}
