import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// The three small bars under the illustration.
/// The active one is wider and cyan (44 x 4), the others are 22 x 4.
class PageDots extends StatelessWidget {
  const PageDots({super.key, required this.activeIndex, this.count = 3});

  final int activeIndex; // 0, 1 or 2
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return Container(
          width: isActive ? 44 : 22,
          height: 4,
          margin: EdgeInsets.only(left: index == 0 ? 0 : 8),
          decoration: BoxDecoration(
            color: isActive ? AppColors.cyan : AppColors.dotOff,
            borderRadius: BorderRadius.circular(2),
            boxShadow: isActive
                ? const [BoxShadow(color: AppColors.cyanGlow, blurRadius: 8)]
                : null,
          ),
        );
      }),
    );
  }
}
