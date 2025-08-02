import 'package:flutter_getit/flutter_getit.dart';

import '../core/app_database.dart';
import '../core/env.dart';
import '../core/restClient/rest_client.dart';

class ApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
    Bind.singleton((i) => RestClient(Env.backendBaseUrl)),
    Bind.singleton((i) => AppDatabase()),
  ];
}
