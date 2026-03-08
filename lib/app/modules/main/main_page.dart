import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/ui/theme/app_theme.dart';
import 'childbirth/childbirth_page.dart';
import 'gestation/gestation_page.dart';
import 'home/home_page.dart';
import 'main_controller.dart';
import 'profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = Modular.get<MainController>();

  List<Tab> get _tabs => [
    const Tab(icon: Icon(CupertinoIcons.home, size: 26), text: 'Home'),
    const Tab(icon: Icon(CupertinoIcons.heart, size: 26), text: 'Gestação'),
    const Tab(icon: Icon(CupertinoIcons.doc_text, size: 26), text: 'Parto'),
    const Tab(icon: Icon(Icons.person_outline_rounded, size: 28), text: 'Perfil'),
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
        appBar: AppBar(
          title: Observer(builder: (context) => Text(controller.tabName, style: AppTheme.titleStyle)),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: const [HomePage(), GestationPage(), ChildbirthPage(), ProfilePage()],
        ),
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            child: TabBar(
              labelColor: AppTheme.darkTextColor,
              onTap: (value) {
                controller.setTabName(nomes[value]);
              },
              indicator: const BoxDecoration(
                border: Border(top: BorderSide(width: 2.5, color: AppTheme.darkTextColor)),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppTheme.darkTextColor,
              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelColor: AppTheme.darkTextColor.withValues(alpha: .5),
              tabAlignment: TabAlignment.fill,
              tabs: _tabs,
            ),
          ),
        ),
      ),
    );
  }
}
