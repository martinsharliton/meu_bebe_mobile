// import 'package:asyncstate/asyncstate.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_getit/flutter_getit.dart';

// import 'theme/app_theme.dart';

// class CoreConfig extends StatelessWidget {
//   const CoreConfig({
//     super.key,
//     this.binding,
//     this.pages,
//     this.pagesBuilders,
//     this.modules,
//     required this.title,
//     this.didStart,
//   });

//   final ApplicationBindings? binding;
//   final List<FlutterGetItPageRouter>? pages;
//   final List<FlutterGetItModuleRouter>? pagesBuilders;
//   final List<FlutterGetItModule>? modules;
//   final String title;
//   final VoidCallback? didStart;

//   @override
//   Widget build(BuildContext context) {
//     return FlutterGetIt(
//       //debugMode: kDebugMode,
//       bindings: binding,
//       modules: modules,
//       pagesRouter: [...pages ?? [], ...pagesBuilders ?? []],
//       builder: (context, routes, s) {
//         return AsyncStateBuilder(
//           //loader: Loader(),
//           builder: (navigatorObserver) {
//             if (didStart != null) {
//               didStart!();
//             }
//             return MaterialApp(
//               theme: AppTheme.lightTheme,
//               darkTheme: AppTheme.darkTheme,
//               routes: routes,
//               navigatorObservers: [navigatorObserver],
//               title: title,
//               debugShowCheckedModeBanner: false,
//             );
//           },
//         );
//       },
//     );
//   }
// }
