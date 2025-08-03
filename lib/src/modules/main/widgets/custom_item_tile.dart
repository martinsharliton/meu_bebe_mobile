import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class CustomItemTile extends StatelessWidget {
  const CustomItemTile({
    super.key,
    required this.flex,
    required this.title,
    required this.content,
  });

  final int flex;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: flex,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.subTitleStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppTheme.secondaryColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              content,
              style: AppTheme.textStyle.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
