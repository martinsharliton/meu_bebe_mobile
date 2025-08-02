import 'package:flutter_getit/flutter_getit.dart';

import 'formulario_page.dart';

class FormularioRouter extends FlutterGetItModuleRouter {
  FormularioRouter()
    : super(
        name: '/initial_form',
        pages: [
          FlutterGetItPageRouter(
            name: '/form',
            builder: (context) => const FormularioPage(),
          ),
        ],
      );
}
