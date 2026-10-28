import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_text.dart';

/// Boxed input used on the Log In screen:
/// small UPPERCASE label on top, icon + text below, optional eye button.
class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.icon,
    this.initialText = '',
    this.isPassword = false,
    this.keyboardType,
  });

  final String label;
  final IconData icon;
  final String initialText;
  final bool isPassword;
  final TextInputType? keyboardType;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late final TextEditingController _controller;
  bool _hidden = true; // only used for password fields

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
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppText.inter(10,
                weight: FontWeight.w600,
                color: AppColors.textMuted,
                letterSpacing: 0.8),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(widget.icon, size: 15, color: AppColors.textSecondary),
              const SizedBox(width: 7),
              Expanded(
                child: TextField(
                  controller: _controller,
                  obscureText: widget.isPassword && _hidden,
                  keyboardType: widget.keyboardType,
                  cursorColor: AppColors.cyan,
                  style: AppText.inter(14),
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 2),
                  ),
                ),
              ),
              if (widget.isPassword)
                GestureDetector(
                  onTap: () => setState(() => _hidden = !_hidden),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 3),
                    child: Icon(
                      _hidden
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 17,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
