import 'package:flutter/material.dart';

import '../../../core/extensions/size_extension.dart';
import '../../../core/theme/app_theme.dart';
import 'childbirth_resume/childbirth_resume_card.dart';
import 'update_childbirth/update_childbirth_card.dart';

class ChildbirthPage extends StatefulWidget {
  const ChildbirthPage({super.key});

  @override
  State<ChildbirthPage> createState() => _ChildbirthPageState();
}

class _ChildbirthPageState extends State<ChildbirthPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: double.infinity,
      color: AppTheme.secondaryColor,
      padding: const EdgeInsets.all(10),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            ChildbirthResumeCard(),
            SizedBox(height: 16),
            UpdateChildbirthCard(),
          ],
        ),
      ),
    );
  }
}
