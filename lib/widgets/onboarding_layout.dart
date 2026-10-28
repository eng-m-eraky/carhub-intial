import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_text.dart';
import 'onboarding_header.dart';
import 'page_dots.dart';
import 'pill_button.dart';

/// The structure shared by all three onboarding screens (measured on a
/// 393 x 852 design):
///   header -> hero image -> dots -> small cyan label -> title ->
///   description -> (space) -> big button -> "Already have an account?"
/// Each screen only supplies the parts that change.
class OnboardingLayout extends StatelessWidget {
  const OnboardingLayout({
    super.key,
    required this.activeDot,
    required this.hero,
    required this.heroHeight,
    required this.label,
    required this.titleSpans,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
    required this.onSkip,
    required this.onSignIn,
    this.descriptionSize = 15,
    this.descriptionLineHeight = 24,
    this.footerSize = 14,
  });

  final int activeDot;
  final Widget hero; // the illustration
  final double heroHeight;
  final String label; // e.g. CONNECTED VEHICLE INTELLIGENCE
  final List<TextSpan> titleSpans; // use '\n' for the line break
  final String description;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final VoidCallback onSkip;
  final VoidCallback onSignIn;
  final double descriptionSize;
  final double descriptionLineHeight;
  final double footerSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // LayoutBuilder + scroll view + IntrinsicHeight lets the Spacer below
      // push the button to the bottom on tall phones, while small phones can
      // still scroll instead of showing an overflow error.
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SizedBox(height: 61),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21),
                      child: OnboardingHeader(onSkip: onSkip),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                        height: heroHeight,
                        width: double.infinity,
                        child: hero),
                    const SizedBox(height: 6),
                    PageDots(activeIndex: activeDot),
                    const SizedBox(height: 34),
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: AppText.inter(10.5,
                          weight: FontWeight.w600,
                          color: AppColors.cyan,
                          letterSpacing: 1.2),
                    ),
                    const SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        style: AppText.inter(28,
                            weight: FontWeight.w300, height: 32 / 28),
                        children: titleSpans,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: AppText.inter(descriptionSize,
                            color: AppColors.textSecondary,
                            height: descriptionLineHeight / descriptionSize),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21),
                      child: PillButton(
                          text: buttonText, onPressed: onButtonPressed),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? ',
                            style: AppText.inter(footerSize,
                                color: AppColors.textSecondary)),
                        GestureDetector(
                          onTap: onSignIn,
                          child: Text('Sign In',
                              style: AppText.inter(footerSize,
                                  weight: FontWeight.w600,
                                  color: AppColors.cyan)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 34),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
