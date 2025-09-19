import 'package:signals_flutter/signals_core.dart';

import '../../../core/helpers/messages.dart';

class HomeController {
  final test = signal<int>(0);

  void showTest() {
    Messages.showInfo('Teste: ${test.value}');
  }

  void addTest() {
    test.value++;
  }
}
