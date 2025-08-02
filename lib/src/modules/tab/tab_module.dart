import 'package:flutter_getit/flutter_getit.dart';

import '../../repositories/gestation/gestation_repository.dart';
import '../../repositories/gestation/gestation_repository_impl.dart';
import 'childbirth/childbirth_router.dart';
import 'custom_tab_controller.dart';
import 'gestation/gestation_router.dart';
import 'home/home_router.dart';
import 'profile/profile_router.dart';

class TabModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/tab';

  @override
  List<Bind<Object>> get bindings => [
    Bind.singleton<GestationRepository>((i) => GestationRepositoryImpl()),
    Bind.singleton((i) => CustomTabController(gestationRepository: i())),
  ];

  @override
  List<FlutterGetItModuleRouter> get pages => [
    HomeRouter(),
    ChildbirthRouter(),
    GestationRouter(),
    ProfileRouter(),
  ];
}
