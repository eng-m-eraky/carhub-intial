import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_text.dart';

/// Top row of every onboarding screen: CH badge, "CARHUB AI" and Skip.
class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key, required this.onSkip});

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/ch_badge.png', width: 27, height: 27),
        const SizedBox(width: 10),
        Text.rich(
          TextSpan(
            style: AppText.inter(12, weight: FontWeight.w700, letterSpacing: 1.6),
            children: const [
              TextSpan(text: 'CARHUB '),
              TextSpan(text: 'AI', style: TextStyle(color: AppColors.cyan)),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onSkip,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: Text(
              'Skip',
              style: AppText.inter(16,
                  weight: FontWeight.w500, color: AppColors.textSecondary),
            ),
          ),
        ),
      ],
    );
  }
}
