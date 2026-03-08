import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/expectations/expectations_repository_impl.dart';
import '../../repositories/gestation/gestation_repository_impl.dart';
import '../../repositories/history/history_repository_impl.dart';
import '../../repositories/medication/medication_repository_impl.dart';
import '../../repositories/profile/profile_repository_impl.dart';
import '../../repositories/vaccines/vaccines_repository_impl.dart';
import 'childbirth/submodules/expectations/expectations_controller.dart';
import 'childbirth/submodules/history/history_controller.dart';
import 'childbirth/submodules/identification/identification_controller.dart';
import 'home/submodules/medication/medication_controller.dart';
import 'home/submodules/vaccines/vaccines_controller.dart';
import 'main_controller.dart';
import 'main_page.dart';
import 'profile/submodules/profile_data/profile_data_controller.dart';

class MainModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(GestationRepositoryImpl.new);
    i.addSingleton(ProfileRepositoryImpl.new);
    i.addSingleton(VaccinesRepositoryImpl.new);
    i.addSingleton(MedicationRepositoryImpl.new);
    i.addSingleton(HistoryRepositoryImpl.new);
    i.addSingleton(ExpectationsRepositoryImpl.new);

    i.addSingleton(VaccinesController.new);
    i.addSingleton(MedicationController.new);
    i.addSingleton(ProfileDataController.new);
    i.addSingleton(ExpectationsController.new);
    i.addSingleton(HistoryController.new);
    i.addSingleton(IdentificationController.new);
    i.addSingleton(MainController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => MainPage());
  }
}
