import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_text.dart';

/// "OR CONTINUE WITH" divider followed by the Apple ID and Google buttons.
/// No real sign-in happens: the buttons only exist visually for now.
class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: _Line()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'OR CONTINUE WITH',
                style: AppText.inter(10,
                    weight: FontWeight.w600,
                    color: AppColors.textMuted,
                    letterSpacing: 1.0),
              ),
            ),
            const Expanded(child: _Line()),
          ],
        ),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(
              child: _SocialButton(
                label: 'Apple ID',
                icon: Icon(Icons.apple, size: 17, color: AppColors.textPrimary),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _SocialButton(label: 'Google', icon: _GoogleGlyph()),
            ),
          ],
        ),
      ],
    );
  }
}

class _Line extends StatelessWidget {
  const _Line();

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: AppColors.border);
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.label, required this.icon});

  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.socialButtonFill,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 9),
          Text(label,
              style: AppText.inter(12, weight: FontWeight.w600)),
        ],
      ),
    );
  }
}

/// PLACEHOLDER: the Google icon was not among the uploaded assets.
/// Replace this widget with the original icon (e.g. Image.asset or SvgPicture)
/// once you export it from Figma.
class _GoogleGlyph extends StatelessWidget {
  const _GoogleGlyph();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 17,
      height: 17,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.textPrimary, width: 1.4),
      ),
      child: Text('G',
          style: AppText.inter(10, weight: FontWeight.w800, height: 1.0)),
    );
  }
}
