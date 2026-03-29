import 'package:flutter/material.dart';

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
    this.backgroundColor = Colors.white,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Row(
            children: [
              Icon(icon, size: 25, color: iconColor ?? Colors.black87),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: textColor ?? Colors.black87),
                ),
              ),
              Icon(Icons.chevron_right, color: (textColor ?? Colors.black87).withValues(alpha: 0.6)),
            ],
          ),
        ),
      ),
    );
  }
}
