import 'package:flutter_getit/flutter_getit.dart';

import '../../../../repositories/profile/profile_repository.dart';
import '../../../../repositories/profile/profile_repository_impl.dart';
import 'profile_data_controller.dart';
import 'profile_data_page.dart';

class ProfileDataModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/profile-data';
  @override
  List<Bind<Object>> get bindings => [
    Bind.singleton<ProfileRepository>((i) => ProfileRepositoryImpl()),
    Bind.singleton(
      (i) => ProfileDataController(
        gestationRepository: i(),
        profileRepository: i(),
      ),
    ),
  ];

  @override
  List<FlutterGetItPageRouter> get pages => [
    FlutterGetItPageRouter(name: '/', builder: (_) => const ProfileDataPage()),
  ];
}
