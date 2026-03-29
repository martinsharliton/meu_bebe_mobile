import 'package:flutter/material.dart';

import '../../../../../../../core/ui/theme/styles/colors_app.dart';
import '../../../../../../../core/ui/theme/styles/text_styles.dart';

class InformationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const InformationCard({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              spacing: 15,
              children: [
                Icon(icon, size: 40, color: colors.darkText),
                Text(title, style: textStyles.subTitleStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
