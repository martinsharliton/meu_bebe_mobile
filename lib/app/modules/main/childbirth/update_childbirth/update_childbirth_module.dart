import 'package:flutter_modular/flutter_modular.dart';

import '../submodules/current_gestation/current_gestation_router.dart';
import '../submodules/expectations/expectations_router.dart';
import '../submodules/history/history_router.dart';
import '../submodules/identification/identification_router.dart';

class UpdateChildbirthModule extends Module {
  @override
  void routes(r) {
    r.module('/identification', module: IdentificationRouter());
    r.module('/history', module: HistoryRouter());
    r.module('/current-gestation', module: CurrentGestationRouter());
    r.module('/expectations', module: ExpectationsRouter());
  }
}
