import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

mixin Mensagens<T extends StatefulWidget> on State<T> {
  Future<void> showErrorWithCloseButton(String message) async {
    _showSnackbarCustom(
      message: message,
      textAlign: TextAlign.justify,
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      foregroundColor: const Color(0xFFC62828),
      backgroundColor: const Color(0xFFFFEBEE),
      borderColor: const Color(0xFFFFCDD2),
      duration: const Duration(seconds: 25),
      closeButton: true,
    );
  }

  Future<void> showError(String message) async {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFFC62828),
      backgroundColor: const Color(0xFFFFEBEE),
      borderColor: const Color(0xFFFFCDD2),
    );
  }

  Future<void> showWarning(String message) async {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFFEF6C00),
      backgroundColor: const Color(0xFFFFF8E1),
      borderColor: const Color(0xFFFFE0B2),
    );
  }

  Future<void> showInfo(String message) async {
    _showSnackbarCustom(
      message: message,
      foregroundColor: AppTheme.darkTextColor,
      backgroundColor: AppTheme.primaryColor,
      borderColor: AppTheme.secondaryColor,
    );
  }

  Future<void> showSuccess(String message) async {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFF2E7D32),
      backgroundColor: const Color(0xFFE6F4EA),
      borderColor: const Color(0xFFA5D6A7),
    );
  }

  Future<void> _showSnackbarCustom({
    required String message,
    required Color backgroundColor,
    required Color foregroundColor,
    required Color borderColor,
    EdgeInsetsGeometry padding = const EdgeInsets.all(10),
    Duration duration = const Duration(seconds: 5),
    bool closeButton = false,
    TextAlign textAlign = TextAlign.justify,
  }) async {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        elevation: 5,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: BorderSide(color: borderColor, width: 1.25),
        ),
        duration: duration,
        backgroundColor: backgroundColor,
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  message.trim(),
                  textAlign: textAlign,
                  style: TextStyle(color: foregroundColor, fontSize: 17),
                ),
              ),
              if (closeButton)
                InkWell(
                  onTap: () {
                    if (mounted) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    }
                  },
                  child: Text(
                    'Fechar',
                    style: TextStyle(
                      color: foregroundColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
