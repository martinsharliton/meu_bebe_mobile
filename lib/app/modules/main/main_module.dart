import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/gestation/gestation_repository.dart';
import '../../repositories/gestation/gestation_repository_impl.dart';
import '../../repositories/medication/medication_repository.dart';
import '../../repositories/medication/medication_repository_impl.dart';
import '../../repositories/profile/profile_repository.dart';
import '../../repositories/profile/profile_repository_impl.dart';
import '../../repositories/vaccines/vaccines_repository.dart';
import '../../repositories/vaccines/vaccines_repository_impl.dart';
import 'home/submodules/medication/medication_controller.dart';
import 'home/submodules/vaccines/vaccines_controller.dart';
import 'profile/profile_data/profile_data_controller.dart';
import 'main_controller.dart';
import 'main_page.dart';

class MainModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<GestationRepository>(GestationRepositoryImpl.new);
    i.addSingleton<ProfileRepository>(ProfileRepositoryImpl.new);
    i.addSingleton<VaccinesRepository>(VaccinesRepositoryImpl.new);
    i.addSingleton<MedicationRepository>(MedicationRepositoryImpl.new);

    i.addSingleton(VaccinesController.new);
    i.addSingleton(MedicationController.new);
    i.addSingleton(ProfileDataController.new);
    i.addSingleton(MainController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => MainPage());
  }
}
