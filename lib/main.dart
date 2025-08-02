import 'dart:async';
import 'dart:developer';

import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'src/binding/application_binding.dart';
import 'src/core/theme/app_theme.dart';
import 'src/modules/auth/auth_module.dart';
import 'src/modules/tab/childbirth/childbirth_resume/childbirth_resume_module.dart';
import 'src/modules/tab/childbirth/update_childbirth/update_childbirth_module.dart';
import 'src/modules/tab/tab_module.dart';
import 'src/pages/splash_page/splash_page.dart';

void main() {
  runZonedGuarded(() => runApp(const AppGestante()), (error, stack) {
    log('Erro nao tratado', error: error, stackTrace: stack);
  });
}

class AppGestante extends StatelessWidget {
  const AppGestante({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      builder: (context, routes, isReady) {
        return AsyncStateBuilder(
          // customLoader: Loader(),
          builder: (navigatorObserver) {
            return MaterialApp(
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              routes: routes,
              navigatorObservers: [navigatorObserver],
              title: 'App Gestante',
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
      bindings: ApplicationBinding(),
      pagesRouter: [
        FlutterGetItPageRouter(builder: (_) => const SplashPage(), name: '/'),
      ],
      modules: [
        AuthModule(),
        TabModule(),
        ChildbirthResumeModule(),
        UpdateChildbirthModule(),
      ],
    );
  }
}
