import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// The rounded dark card that holds the tabs and the form.
class AuthCard extends StatelessWidget {
  const AuthCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 23),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.authCardTop, AppColors.authCardBottom],
        ),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.divider),
        boxShadow: const [
          BoxShadow(
              color: AppColors.cardShadow, blurRadius: 40, offset: Offset(0, 16)),
        ],
      ),
      child: child,
    );
  }
}
