import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool spacer;

  const HomeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.spacer = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
}
