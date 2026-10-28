import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// CarHub logo (icon + wordmark + tagline) with a soft glow, used above the
/// Log In / Sign up card. The logo image has a little empty space around it,
/// so it starts 50px from the top to place the icon at y = 77 like the design.
class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 272, // the card starts at y = 272
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 10,
            child: Container(
              width: 280,
              height: 280,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [AppColors.logoGlow, Color(0x0000E5FF)],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            // height 222 trims 2px of empty image space at the bottom
            child: Image.asset(
              'assets/images/carhub_logo.png',
              width: 241,
              height: 222,
              fit: BoxFit.none,
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }
}
