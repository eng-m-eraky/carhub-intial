import 'package:flutter/material.dart';

/// A short fade between screens instead of the default slide.
Route<void> _fadeRoute(Widget page) {
  return PageRouteBuilder<void>(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}

/// Opens [page] on top of the current screen (back button returns).
/// Used for Next: onboarding 1 -> 2 -> 3.
void pushScreen(BuildContext context, Widget page) {
  Navigator.of(context).push(_fadeRoute(page));
}

/// Replaces the current screen. Used to switch between Log In and Sign up
/// so the back button doesn't pile up old copies of them.
void replaceScreen(BuildContext context, Widget page) {
  Navigator.of(context).pushReplacement(_fadeRoute(page));
}

/// Opens [page] and removes every earlier screen (the whole onboarding flow).
/// Used by Skip, Sign In and the last Get Started button.
void openAuthScreen(BuildContext context, Widget page) {
  Navigator.of(context).pushAndRemoveUntil(_fadeRoute(page), (route) => false);
}
