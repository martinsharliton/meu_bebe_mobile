import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

mixin Mensagens<T extends StatefulWidget> on State<T> {
  Future<void> showErrorWithCloseButton(String message) async {
    _showSnackbarCustom(
      message: message,
      textAlign: TextAlign.justify,
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      foregroundColor: const Color(0xFFB02E2E), // Vermelho infantil suave
      backgroundColor: const Color(0xFFFFE8E8), // Fundo rosa claro suave
      duration: const Duration(seconds: 25),
      closeButton: true,
    );
  }

  Future<void> showError(String message) async {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFFB02E2E),
      backgroundColor: const Color(0xFFFFE8E8),
    );
  }

  Future<void> showWarning(String message) async {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFFCC7A00), // Laranja pastel
      backgroundColor: const Color(0xFFFFF4E0), // Amarelo-clarinho suave
    );
  }

  Future<void> showInfo(String message) async {
    _showSnackbarCustom(
      message: message,
      foregroundColor: AppTheme.darkTextColor, // Azul petróleo ameno
      backgroundColor: AppTheme.primaryColor, // Azul bebê clarinho
    );
  }

  Future<void> showSuccess(String message) async {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFF2A7D54), // Verde água suave
      backgroundColor: const Color(0xFFE0F8F2), // Verde bebê clarinho
    );
  }

  Future<void> _showSnackbarCustom({
    required String message,
    required Color backgroundColor,
    required Color foregroundColor,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
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
