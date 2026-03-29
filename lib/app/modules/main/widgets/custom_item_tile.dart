import 'package:flutter/material.dart';

import '../../../core/ui/theme/styles/colors_app.dart';
import '../../../core/ui/theme/styles/text_styles.dart';

class CustomItemTile extends StatelessWidget {
  const CustomItemTile({super.key, required this.flex, required this.title, required this.content});

  final int flex;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Flexible(
      fit: FlexFit.tight,
      flex: flex,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textStyles.subTitleStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
          Container(
            width: double.infinity,
            height: 40,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(color: colors.secondary, borderRadius: BorderRadius.circular(7)),
            child: Text(content, style: textStyles.textStyle.copyWith(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
