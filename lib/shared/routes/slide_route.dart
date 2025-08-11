// lib/shared/routes/slide_route.dart

import 'package:flutter/material.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget page;
  final Offset beginOffset;

  // The constructor now takes an additional `beginOffset` parameter.
  SlideRoute({required this.page, required this.beginOffset})
    : super(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) => page,
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              // The end position is always the same (center of the screen).
              const end = Offset.zero;
              const curve = Curves.ease;

              // We create a Tween that uses our dynamic `beginOffset`.
              var tween = Tween(
                begin: beginOffset,
                end: end,
              ).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
      );
}
