import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_text.dart';

/// The big rounded box on the Sign up screen that holds the four fields
/// (Full Name, Email, Phone, Password) separated by thin lines.
class SignupFieldGroup extends StatelessWidget {
  const SignupFieldGroup({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias, // keeps the strength bars inside the corners
      child: Column(children: children),
    );
  }
}

/// A thin horizontal separator between rows.
class SignupDivider extends StatelessWidget {
  const SignupDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: AppColors.divider);
  }
}

/// One row: grey label on top, cyan icon and the editable value below.
class SignupFieldRow extends StatefulWidget {
  const SignupFieldRow({
    super.key,
    required this.label,
    required this.icon,
    this.initialText = '',
    this.prefix, // optional widget before the text, e.g. "+20 |"
    this.isPassword = false,
    this.keyboardType,
  });

  final String label;
  final IconData icon;
  final String initialText;
  final Widget? prefix;
  final bool isPassword;
  final TextInputType? keyboardType;

  @override
  State<SignupFieldRow> createState() => _SignupFieldRowState();
}

class _SignupFieldRowState extends State<SignupFieldRow> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label,
              style: AppText.inter(12, color: AppColors.textSecondary)),
          const SizedBox(height: 9),
          SizedBox(
            height: 24,
            child: Row(
              children: [
                Icon(widget.icon, size: 15, color: AppColors.cyan),
                const SizedBox(width: 12),
                if (widget.prefix != null) widget.prefix!,
                Expanded(
                  child: TextField(
                    controller: _controller,
                    obscureText: widget.isPassword,
                    keyboardType: widget.keyboardType,
                    cursorColor: AppColors.cyan,
                    style: AppText.inter(18),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// "+20 |" shown before the phone number.
class PhoneCodePrefix extends StatelessWidget {
  const PhoneCodePrefix({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('+20', style: AppText.inter(18)),
        Container(
          width: 1,
          height: 24,
          margin: const EdgeInsets.symmetric(horizontal: 11),
          color: AppColors.border,
        ),
      ],
    );
  }
}

/// Four green bars + "Password strength: Strong".
/// [level] is 0-4 (the design shows 4 = Strong). It is static for now.
class PasswordStrengthBar extends StatelessWidget {
  const PasswordStrengthBar({super.key, this.level = 4});

  final int level;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 4; i++)
          Container(
            width: 36,
            height: 4,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              color: i < level ? AppColors.success : AppColors.dotOff,
              borderRadius: BorderRadius.horizontal(
                left: i == 0 ? Radius.zero : const Radius.circular(2),
                right: const Radius.circular(2),
              ),
            ),
          ),
        const SizedBox(width: 6),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text.rich(
              TextSpan(
                style: AppText.inter(11, color: AppColors.textSecondary),
                children: [
                  const TextSpan(text: 'Password strength: '),
                  TextSpan(
                    text: 'Strong',
                    style: AppText.inter(11,
                        weight: FontWeight.w700, color: AppColors.success),
                  ),
                ],
              ),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ],
    );
  }
}
