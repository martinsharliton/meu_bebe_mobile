import 'package:flutter_getit/flutter_getit.dart';

import '../current_gestation/current_gestation_router.dart';
import '../expectations/expectations_router.dart';
import '../history/history_router.dart';
import '../identification/identification_router.dart';

class UpdateChildbirthModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/update-childbirth';

  @override
  List<FlutterGetItModuleRouter> get pages => [
    IdentificationRouter(),
    HistoryRouter(),
    CurrentGestationRouter(),
    ExpectationsRouter(),
  ];
}
