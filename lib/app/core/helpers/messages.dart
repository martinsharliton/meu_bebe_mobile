import 'package:flutter/material.dart';

class Messages {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showErrorWithCloseButton(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      textAlign: TextAlign.justify,
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      foregroundColor: const Color(0xFF721c24),
      backgroundColor: const Color(0xFFf8d7da),
      borderColor: const Color(0xFFf5c6cb),
      duration: const Duration(seconds: 25),
      closeButton: true,
      fixed: fixed ?? false,
    );
  }

  static void showError(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFF721c24),
      backgroundColor: const Color(0xFFf8d7da),
      borderColor: const Color(0xFFf5c6cb),
      fixed: fixed ?? false,
    );
  }

  static void showWarning(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFF856404),
      backgroundColor: const Color(0xFFfff3cd),
      borderColor: const Color(0xFFffeeba),
      fixed: fixed ?? false,
    );
  }

  static void showInfo(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFF0c5460),
      backgroundColor: const Color(0xFFd1ecf1),
      borderColor: const Color(0xFFbee5eb),
      fixed: fixed ?? false,
    );
  }

  static void showSuccess(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFF155724),
      backgroundColor: const Color(0xFFd4edda),
      borderColor: const Color(0xFFc3e6cb),
      fixed: fixed ?? false,
    );
  }

  static void _showSnackbarCustom({
    required String message,
    required Color backgroundColor,
    required Color foregroundColor,
    required Color borderColor,
    required bool fixed,
    EdgeInsetsGeometry padding = const EdgeInsets.all(10),
    Duration duration = const Duration(seconds: 5),
    bool closeButton = false,
    TextAlign textAlign = TextAlign.justify,
  }) {
    final messenger = messengerKey.currentState;
    if (messenger == null) return;

    messenger.removeCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        elevation: 5,
        behavior: fixed ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        duration: duration,
        backgroundColor: backgroundColor,
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(
            spacing: 10,
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
              Visibility(
                visible: closeButton,
                child: InkWell(
                  onTap: () => messenger.hideCurrentSnackBar(),
                  child: Text(
                    'Fechar',
                    style: TextStyle(
                      color: foregroundColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                    ),
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
