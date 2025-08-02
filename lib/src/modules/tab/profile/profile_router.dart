import 'package:flutter_getit/flutter_getit.dart';

import 'profile_page.dart';
import 'profile_data/profile_data_page.dart';
import 'profile_data/profile_data_controller.dart';
import '../../../repositories/profile/profile_repository.dart';
import '../../../repositories/profile/profile_repository_impl.dart';

class ProfileRouter extends FlutterGetItModuleRouter {
  ProfileRouter()
    : super(
        name: '/initial_profile',
        pages: [
          FlutterGetItPageRouter(
            name: '/profile',
            builder: (context) => const ProfilePage(),
          ),
          FlutterGetItPageRouter(
            name: '/profile-data',
            builder: (context) => const ProfileDataPage(),
          ),
        ],
        bindings: [
          Bind.singleton<ProfileRepository>((i) => ProfileRepositoryImpl()),
          Bind.singleton((i) => ProfileDataController(
            gestationRepository: i(),
            profileRepository: i(),
          )),
        ],
      );
}
