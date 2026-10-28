import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Small cyan checkbox (checked = cyan square with a dark tick).
class CarHubCheckbox extends StatelessWidget {
  const CarHubCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 14,
    this.radius = 4,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: value ? AppColors.cyan : Colors.transparent,
          borderRadius: BorderRadius.circular(radius),
          border: value ? null : Border.all(color: AppColors.border),
        ),
        child: value
            ? Icon(Icons.check, size: size * 0.75, color: AppColors.textDark)
            : null,
      ),
    );
  }
}
