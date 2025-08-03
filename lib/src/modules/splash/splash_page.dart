import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 1500));
      Modular.to.pushReplacementNamed(routeLogin);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/baby_2.png', width: 200, height: 200),
      ),
    );
  }
}
