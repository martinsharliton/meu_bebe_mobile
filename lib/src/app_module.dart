import 'package:flutter_modular/flutter_modular.dart';

import 'modules/core/core_module.dart';
import 'modules/formulario/formulario_module.dart';
import 'modules/login/login_module.dart';
import 'modules/main/childbirth/submodules/childbirth_resume/childbirth_resume_module.dart';
import 'modules/main/childbirth/update_childbirth/update_childbirth_module.dart';
import 'modules/main/home/submodules/appointments_exams/appointments_exams_module.dart';
import 'modules/main/home/submodules/information/information_module.dart';
import 'modules/main/home/submodules/medication/medication_module.dart';
import 'modules/main/home/submodules/vaccines/vaccines_module.dart';
import 'modules/main/main_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module(routeLogin, module: LoginModule());
    r.module(routeForm, module: FormularioModule());
    r.module(routeTab, module: MainModule());

    // Module da Tab Home
    r.module(routeConsultasExames, module: AppointmentsExamsModule());
    r.module(routeInformacoes, module: InformationModule());
    r.module(routeMedicacoes, module: MedicationModule());
    r.module(routeVacinas, module: VaccinesModule());

    // Module da Tab Gestação

    // Module da Tab Plano de Parto

    // Module da Tab Perfil

    r.module(routeChildbirthResume, module: ChildbirthResumeModule());
    r.module(routeUpdateChildbirth, module: UpdateChildbirthModule());
  }
}

const routeLogin = '/login/';
const routeForm = '/form/';
const routeTab = '/tab/';

const routeConsultasExames = '/consultas_exames/';
const routeInformacoes = '/informacoes/';
const routeMedicacoes = '/medicacoes/';
const routeVacinas = '/vacinas/';

const routeChildbirthResume = '/childbirth_resume/';
const routeUpdateChildbirth = '/update_childbirth/';
