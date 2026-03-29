import 'package:flutter/material.dart';

import '../../../../core/extensions/size_extension.dart';
import '../../../../core/ui/theme/styles/colors_app.dart';
import 'widgets/childbirth_resume_card.dart';
import 'widgets/update_childbirth_card.dart';

class ChildbirthPage extends StatefulWidget {
  const ChildbirthPage({super.key});

  @override
  State<ChildbirthPage> createState() => _ChildbirthPageState();
}

class _ChildbirthPageState extends State<ChildbirthPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: context.screenWidth,
      color: colors.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ListView(children: [ChildbirthResumeCard(), SizedBox(height: 16), UpdateChildbirthCard()]),
    );
  }
}
