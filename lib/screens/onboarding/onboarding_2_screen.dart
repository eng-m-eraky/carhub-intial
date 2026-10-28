import 'package:flutter/material.dart';

import '../../core/navigation.dart';
import '../../widgets/onboarding_layout.dart';
import '../auth/login_screen.dart';
import 'onboarding_3_screen.dart';

/// Onboarding 2: engine illustration, "Real-Time Sensor Telemetry".
class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      activeDot: 1,
      heroHeight: 344,
      // The labels (ENGINE ECU, OBD-II BLE...) are part of the original image.
      hero: Image.asset(
        'assets/images/engine_blueprint.png',
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
      ),
      label: 'CONNECTED VEHICLE INTELLIGENCE',
      titleSpans: const [TextSpan(text: 'Real-Time Sensor\nTelemetry')],
      description:
          'Pair any standard OBD-II scanner to monitor live engine parameters, RPM, and clear check engine lights.',
      buttonText: 'Next',
      onButtonPressed: () => pushScreen(context, const Onboarding3Screen()),
      onSkip: () => openAuthScreen(context, const LoginScreen()),
      onSignIn: () => openAuthScreen(context, const LoginScreen()),
    );
  }
}
