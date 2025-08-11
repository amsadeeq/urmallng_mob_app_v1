// lib/shared/routes/slide_right_route.dart

import 'package:flutter/material.dart';

class SlideRightPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  SlideRightPageRoute({required this.page})
    : super(
        // Define the duration of the transition animation.
        transitionDuration: const Duration(milliseconds: 400),
        // The `pageBuilder` returns the destination page widget.
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) => page,
        // The `transitionsBuilder` defines how the page animates.
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              // We define a Tween that goes from off-screen right to the center.
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              // The curve controls the animation's acceleration and deceleration.
              const curve = Curves.ease;

              // The Tween takes the animation and applies it to the Offset range.
              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));

              // We use a SlideTransition to animate the position of the page.
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
      );
}
