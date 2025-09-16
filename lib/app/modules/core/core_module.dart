import 'package:dio/io.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/rest_client.dart';
import '../../database/database.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton<DioForNative>(RestClient.new);
    i.addSingleton(Database.new);
    super.exportedBinds(i);
  }
}
