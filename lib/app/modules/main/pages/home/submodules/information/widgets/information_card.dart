import 'package:flutter/material.dart';

import '../../../../../../../core/ui/theme/styles/colors_app.dart';
import '../../../../../../../core/ui/theme/styles/text_styles.dart';

class InformationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool spacer;

  const InformationCard({super.key, required this.icon, required this.title, required this.onTap, this.spacer = true});

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
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Icon(icon, size: 48, color: colors.darkText),
                const SizedBox(width: 16),
                Text(title, style: textStyles.subTitleStyle),
              ],
            ),
          ),
        ),
        if (spacer) const SizedBox(height: 16),
      ],
    );
  }
}
