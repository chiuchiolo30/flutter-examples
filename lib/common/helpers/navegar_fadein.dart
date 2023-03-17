import 'package:flutter/material.dart';

Route<PageRouteBuilder<dynamic>> navegarMapaFadeIn(
  BuildContext context,
  Widget page,
) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => page,
    transitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (context, animation, _, child) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOut),
        ),
        child: child,
      );
    },
  );
}
