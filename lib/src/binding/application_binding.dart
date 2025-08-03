import 'package:dio/io.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/app_database.dart';
import '../core/restClient/rest_client.dart';

class ApplicationBinding extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton<DioForNative>(RestClient.new);
    i.addSingleton(AppDatabase.new);
    super.exportedBinds(i);
  }
}
