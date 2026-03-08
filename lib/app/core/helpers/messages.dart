import 'package:flutter/material.dart';

class Messages {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showErrorWithCloseButton(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      textAlign: TextAlign.justify,
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      foregroundColor: const Color(0xFFB42318),
      backgroundColor: const Color(0xFFFEE4E2),
      borderColor: const Color(0xFFFDA29B),
      duration: const Duration(seconds: 25),
      closeButton: true,
      fixed: fixed ?? false,
    );
  }

  static void showError(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFFB42318),
      backgroundColor: const Color(0xFFFEE4E2),
      borderColor: const Color(0xFFFDA29B),
      fixed: fixed ?? false,
    );
  }

  static void showWarning(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFFB54708),
      backgroundColor: const Color(0xFFFEF0C7),
      borderColor: const Color(0xFFFEC84B),
      fixed: fixed ?? false,
    );
  }

  static void showInfo(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFF175CD3),
      backgroundColor: const Color(0xFFE0EAFF),
      borderColor: const Color(0xFF84ADFF),
      fixed: fixed ?? false,
    );
  }

  static void showSuccess(String message, {bool? fixed}) {
    _showSnackbarCustom(
      message: message,
      foregroundColor: const Color(0xFF067647),
      backgroundColor: const Color(0xFFD1FADF),
      borderColor: const Color(0xFF6CE9A6),
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

    //messenger.removeCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        elevation: 5,
        behavior: fixed ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
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
                    style: TextStyle(color: foregroundColor, fontWeight: FontWeight.w800, fontSize: 13),
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
