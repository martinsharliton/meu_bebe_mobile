import 'package:flutter/material.dart';

import '../../../../../core/ui/theme/styles/colors_app.dart';
import '../../../../../core/ui/theme/styles/text_styles.dart';

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool spacer;

  const HomeCard({super.key, required this.icon, required this.title, required this.onTap, this.spacer = true});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 26, color: colors.darkText),
            Text(title, style: textStyles.subTitleStyle),
          ],
        ),
      ),
    );
  }
}
