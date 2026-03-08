import 'package:mobx/mobx.dart';

import '../../../core/helpers/messages.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  int test = 0;

  void showTest() {
    Messages.showInfo('Teste: $test');
  }

  @action
  void addTest() {
    test++;
  }
}
