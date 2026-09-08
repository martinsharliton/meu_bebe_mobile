import 'package:flutter/material.dart';

import '../../../../../core/ui/theme/styles/colors_app.dart';
import '../../../../../core/ui/theme/styles/design_tokens.dart';

class TileButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;

  const TileButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      splashColor: Colors.red,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.sm, vertical: Spacing.md),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: colors.primary300.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, size: 23, color: colors.darkText),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: textColor ?? colors.onSurface),
              ),
            ),
            Icon(Icons.chevron_right, color: (textColor ?? colors.onSurface).withValues(alpha: 0.6)),
          ],
        ),
      ),
    );
  }
}
