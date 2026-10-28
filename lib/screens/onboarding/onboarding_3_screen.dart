import 'package:flutter/material.dart';

import '../../core/navigation.dart';
import '../../widgets/onboarding_layout.dart';
import '../auth/login_screen.dart';
import '../auth/signup_screen.dart';

/// Onboarding 3: community illustration, "Expert Community & Garages".
class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      activeDot: 2,
      heroHeight: 344,
      // The chat cards and the "Verified Garage" shield are part of the image.
      hero: Image.asset(
        'assets/images/community_blueprint.png',
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
      ),
      label: 'EXPERTS YOU CAN TRUST',
      titleSpans: const [TextSpan(text: 'Expert Community &\nGarages')],
      description:
          'Connect with experienced mechanics, discuss repair costs, and book appointments at verified local workshops.',
      buttonText: 'Get Started',
      // ASSUMPTION: the last "Get Started" opens Sign up.
      onButtonPressed: () => openAuthScreen(context, const SignupScreen()),
      onSkip: () => openAuthScreen(context, const LoginScreen()),
      onSignIn: () => openAuthScreen(context, const LoginScreen()),
    );
  }
}
