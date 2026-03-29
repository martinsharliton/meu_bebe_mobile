import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'main_controller.dart';
import 'pages/childbirth/childbirth_page.dart';
import 'pages/gestation/gestation_page.dart';
import 'pages/home/home_page.dart';
import 'pages/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = Modular.get<MainController>();

  List<Tab> get _tabs => [
    const Tab(icon: Icon(CupertinoIcons.house_fill, size: 26), text: 'Home'),
    const Tab(icon: Icon(CupertinoIcons.heart_fill, size: 26), text: 'Gestação'),
    const Tab(icon: Icon(CupertinoIcons.doc_text_fill, size: 26), text: 'Parto'),
    const Tab(icon: Icon(CupertinoIcons.person_fill, size: 26), text: 'Perfil'),
  ];

  List<String> get nomes {
    return _tabs.map((tab) => tab.text ?? '').toList();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(title: Observer(builder: (context) => Text(controller.tabName))),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: const [HomePage(), GestationPage(), ChildbirthPage(), ProfilePage()],
        ),
        bottomNavigationBar: SafeArea(
          child: TabBar(
            onTap: (value) {
              controller.setTabName(nomes[value]);
            },
            tabs: _tabs,
          ),
        ),
      ),
    );
  }
}
