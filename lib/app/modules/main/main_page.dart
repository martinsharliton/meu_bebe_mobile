import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../core/theme/app_theme.dart';
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

  List<Widget> get _tabs => [
    const Tab(icon: Icon(CupertinoIcons.house_fill, size: 32), text: 'Home'),
    const Tab(icon: Icon(CupertinoIcons.heart_fill, size: 32), text: 'Gestação'),
    const Tab(icon: Icon(CupertinoIcons.doc_text_fill, size: 32), text: 'Parto'),
    const Tab(icon: Icon(Icons.person_rounded, size: 40), text: 'Perfil'),
  ];

  String nome = 'Home';
  List<String> get nomes {
    return _tabs.whereType<Tab>().map((tab) => tab.text ?? '').toList();
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
          title: Watch((_) {
            return Text(controller.tabName(), style: AppTheme.titleStyle);
          }),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: const [HomePage(), GestationPage(), ChildbirthPage(), ProfilePage()],
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 72,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.5), offset: const Offset(0, -1), blurRadius: 4),
              ],
            ),
            child: TabBar(
              labelColor: AppTheme.textColor,
              onTap: (value) {
                controller.setTabName(nomes[value]);
              },
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: AppTheme.darkTextColor,
              tabAlignment: TabAlignment.fill,
              tabs: _tabs,
            ),
          ),
        ),
      ),
    );
  }
}
