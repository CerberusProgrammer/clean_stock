import 'package:flutter/material.dart';

Future<Object?> showFadeDialog({
  required BuildContext context,
  required Widget child,
  String? title,
}) =>
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
        appBar: AppBar(
          title: title != null ? Text(title) : null,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: child,
      ),
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 300),
    );
