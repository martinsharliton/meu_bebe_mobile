import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../repositories/gestation/gestation_repository_impl.dart';
import '../../../../../repositories/profile/profile_repository_impl.dart';
import 'profile_data_controller.dart';
import 'profile_data_page.dart';

class ProfileDataModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(ProfileRepositoryImpl.new);
    i.addSingleton(GestationRepositoryImpl.new);
    i.addSingleton(ProfileDataController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const ProfileDataPage());
  }
}
