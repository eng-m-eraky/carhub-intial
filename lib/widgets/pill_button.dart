import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_text.dart';

/// The big cyan pill button on the onboarding screens
/// ("Next" / "Get Started") with a small arrow box on the right.
class PillButton extends StatelessWidget {
  const PillButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(color: AppColors.cyanGlow, blurRadius: 24, offset: Offset(0, 8)),
        ],
      ),
      child: Material(
        color: AppColors.cyan,
        borderRadius: BorderRadius.circular(28),
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(left: 23, right: 8),
            child: Row(
              children: [
                Text(text,
                    style: AppText.inter(17,
                        weight: FontWeight.w600, color: AppColors.textDark)),
                const Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.arrowBox,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.chevron_right,
                      size: 20, color: AppColors.textDark),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
