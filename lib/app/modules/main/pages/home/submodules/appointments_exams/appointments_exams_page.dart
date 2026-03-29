import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/ui/theme/styles/text_styles.dart';
import 'appointments_exams_controller.dart';
import 'widgets/appointments_page.dart';
import 'widgets/exams_page.dart';

class AppointmentsExamsPage extends StatefulWidget {
  const AppointmentsExamsPage({super.key});

  @override
  State<AppointmentsExamsPage> createState() => _AppointmentsExamsPageState();
}

class _AppointmentsExamsPageState extends State<AppointmentsExamsPage> {
  final _controller = Modular.get<AppointmentsExamsController>();

  List<Tab> get _tabs => [
    Tab(icon: Icon(Icons.content_paste_search_outlined), text: 'Consultas'),
    Tab(icon: Icon(Icons.local_hospital), text: 'Exames'),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return DefaultTabController(
            length: _tabs.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Consultas e Exames', style: context.textStyles.titleSmallStyle),
                centerTitle: true,
              ),
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  AppointmentsPage(controller: _controller),
                  ExamsPage(controller: _controller),
                ],
              ),
              bottomNavigationBar: SafeArea(child: TabBar(tabs: _tabs)),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
