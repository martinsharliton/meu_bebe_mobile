import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/helpers/messages.dart';
import '../../../../../core/theme/app_theme.dart';
import 'appointments_exams_controller.dart';
import 'widgets/appointments_page.dart';
import 'widgets/exams_page.dart';

class AppointmentsExamsPage extends StatefulWidget {
  const AppointmentsExamsPage({super.key});

  @override
  State<AppointmentsExamsPage> createState() => _AppointmentsExamsPageState();
}

class _AppointmentsExamsPageState extends State<AppointmentsExamsPage>
    with MessageViewMixin {
  final _controller = Modular.get<AppointmentsExamsController>();

  @override
  void initState() {
    super.initState();
    messageListener(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Consultas e Exames',
                  style: AppTheme.titleSmallStyle,
                ),
                centerTitle: true,
              ),
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  AppointmentsPage(controller: _controller),
                  ExamsPage(controller: _controller),
                ],
              ),
              bottomNavigationBar: Container(
                color: Colors.white,
                child: const TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.content_paste_search_outlined),
                      text: 'Consultas',
                    ),
                    Tab(icon: Icon(Icons.local_hospital), text: 'Exames'),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
