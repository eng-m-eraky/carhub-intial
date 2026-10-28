import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_text.dart';

/// The "Log In | Sign Up" switch at the top of the card.
/// The two screens use slightly different capitalisation in the design
/// ("Log In / Sign Up" vs "Log in / Sign up"), so the labels are parameters.
class AuthTabSwitcher extends StatelessWidget {
  const AuthTabSwitcher({
    super.key,
    required this.loginSelected,
    required this.loginLabel,
    required this.signupLabel,
    required this.onLoginTap,
    required this.onSignupTap,
  });

  final bool loginSelected;
  final String loginLabel;
  final String signupLabel;
  final VoidCallback onLoginTap;
  final VoidCallback onSignupTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.tabTrack,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.authCardTop),
      ),
      child: Row(
        children: [
          Expanded(child: _tab(loginLabel, loginSelected, onLoginTap)),
          Expanded(child: _tab(signupLabel, !loginSelected, onSignupTap)),
        ],
      ),
    );
  }

  Widget _tab(String text, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.tabSelected : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: AppText.inter(13,
              weight: FontWeight.w600,
              color: selected ? AppColors.cyan : AppColors.textSecondary),
        ),
      ),
    );
  }
}
