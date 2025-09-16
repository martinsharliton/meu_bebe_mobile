import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/global_context.dart';
import 'core/theme/app_theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    GlobalContext.instance.navigatorKey = _navigatorKey;
    Modular.setNavigatorKey(_navigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Meu Bebê',
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}
