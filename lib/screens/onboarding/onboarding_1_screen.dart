import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/navigation.dart';
import '../../widgets/onboarding_layout.dart';
import '../auth/login_screen.dart';
import 'onboarding_2_screen.dart';

/// Onboarding 1: logo hero, "Instant AI Car Diagnostics".
class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      activeDot: 0,
      // This screen is shorter than the other two: the logo area is 313 high.
      heroHeight: 313,
      hero: Stack(
        alignment: Alignment.center,
        children: [
          // Soft cyan glow behind the logo.
          Container(
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [AppColors.logoGlow, Color(0x0000E5FF)],
              ),
            ),
          ),
          Image.asset('assets/images/carhub_logo.png', width: 241),
        ],
      ),
      label: 'INTELLIGENT VEHICLE CARE',
      titleSpans: const [
        TextSpan(text: 'Instant AI Car\n'),
        TextSpan(text: 'Diagnostics', style: TextStyle(color: AppColors.cyan)),
      ],
      description:
          'Describe symptoms in plain words or plug in your OBD sensor for real-time DTC engine analysis.',
      // The design shows smaller description/footer text on this screen.
      descriptionSize: 12,
      descriptionLineHeight: 17,
      footerSize: 10,
      buttonText: 'Get Started',
      // ASSUMPTION: on this first screen "Get Started" moves to Onboarding 2.
      onButtonPressed: () => pushScreen(context, const Onboarding2Screen()),
      // ASSUMPTION: Skip jumps straight to Log In.
      onSkip: () => openAuthScreen(context, const LoginScreen()),
      onSignIn: () => openAuthScreen(context, const LoginScreen()),
    );
  }
}
