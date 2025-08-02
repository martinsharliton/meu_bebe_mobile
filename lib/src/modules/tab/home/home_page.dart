import 'package:flutter/material.dart';

import '../../../core/extensions/size_extension.dart';
import '../../../core/helpers/messages.dart';
import '../../../core/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MessageViewMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      color: AppTheme.secondaryColor,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Image.asset('assets/images/baby_2.png', height: 150),
            const SizedBox(height: 16),
            _buildCard(
              Icons.assignment_add,
              'Consultas e exames',
              () => Navigator.pushNamed(context, '/home/appointments-exams/'),
            ),
            _buildCard(
              Icons.vaccines,
              'Minhas vacinas',
              () => Navigator.pushNamed(
                context,
                '/tab/initial_homes/homes/vaccines',
              ),
            ),
            _buildCard(
              Icons.medication_outlined,
              'Meus medicamentos',
              () => Navigator.pushNamed(
                context,
                '/tab/initial_homes/homes/medication',
              ),
            ),
            _buildCard(
              Icons.info_outline,
              'Informações básicas',
              () => Navigator.pushNamed(
                context,
                '/tab/initial_homes/homes/information',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool spacer = true,
  }) => Column(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Icon(icon, size: 48, color: AppTheme.darkTextColor),
              const SizedBox(width: 16),
              Text(title, style: AppTheme.subTitleStyle),
            ],
          ),
        ),
      ),
      if (spacer) const SizedBox(height: 16),
    ],
  );
}
