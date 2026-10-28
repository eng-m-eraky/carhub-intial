import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_text.dart';

/// The wide cyan gradient button on Log In / Sign up with a glow and a
/// slightly darker bottom edge, like the design.
class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.buttonBottomEdge, // shows as the bottom edge
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: AppColors.cyanGlow, blurRadius: 24, offset: Offset(0, 6)),
        ],
      ),
      child: Stack(
        children: [
          // gradient face, 2px shorter so the edge color shows underneath
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppColors.buttonGradientStart,
                    AppColors.buttonGradientEnd,
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: onPressed,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 2),
                  child: Row(
                    children: [
                      Text(text,
                          style: AppText.inter(14,
                              weight: FontWeight.w700,
                              color: AppColors.textDark)),
                      const Spacer(),
                      const Icon(Icons.chevron_right,
                          size: 18, color: AppColors.textDark),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
