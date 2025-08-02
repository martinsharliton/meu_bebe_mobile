import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import 'childbirth/childbirth_page.dart';
import 'gestation/gestation_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  List<Widget> get _tabs => [
    Tab(icon: Icon(Icons.home_rounded, size: 40), text: 'Home'),
    Tab(icon: Icon(Icons.pregnant_woman, size: 40), text: 'Gestação'),
    Tab(icon: Icon(Icons.assignment_rounded, size: 40), text: 'Plano de Parto'),
    Tab(icon: Icon(Icons.person_rounded, size: 40), text: 'Perfil'),
  ];

  String nome = 'Home';
  List<String> get nomes => _tabs
      .whereType<Tab>()
      .map((tab) => (tab.text ?? '').split(' ').first)
      .toList();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tabController.index =
          ModalRoute.of(context)?.settings.arguments as int? ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nome, style: AppTheme.titleStyle)),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          GestationPage(),
          ChildbirthPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                offset: const Offset(0, -1),
                blurRadius: 4,
              ),
            ],
          ),
          child: TabBar(
            controller: _tabController,
            labelColor: AppTheme.textColor,
            onTap: (value) {
              setState(() {
                nome = nomes[value];
              });
            },
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: AppTheme.darkTextColor,

            tabAlignment: TabAlignment.center,
            isScrollable: true,
            tabs: _tabs,
          ),
        ),
      ),
    );
  }
}
