import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_text.dart';
import '../../core/navigation.dart';
import '../../widgets/auth_card.dart';
import '../../widgets/auth_logo.dart';
import '../../widgets/auth_tab_switcher.dart';
import '../../widgets/auth_text_field.dart';
import '../../widgets/carhub_checkbox.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/social_buttons.dart';
import 'signup_screen.dart';

/// Log In screen. UI only: nothing is sent anywhere.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = true; // the design shows it ticked

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthLogo(),
            AuthCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthTabSwitcher(
                    loginSelected: true,
                    loginLabel: 'Log In',
                    signupLabel: 'Sign Up',
                    onLoginTap: () {},
                    onSignupTap: () =>
                        replaceScreen(context, const SignupScreen()),
                  ),
                  const SizedBox(height: 17),
                  Text('Welcome back',
                      style: AppText.inter(18, weight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text('Access your garage and diagnostics',
                      style: AppText.inter(11.5,
                          color: AppColors.textSecondary)),
                  const SizedBox(height: 14),
                  const AuthTextField(
                    label: 'EMAIL ADDRESS',
                    icon: Icons.mail_outline,
                    initialText: 'jordan@example.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  const AuthTextField(
                    label: 'PASSWORD',
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CarHubCheckbox(
                        value: _rememberMe,
                        onChanged: (v) => setState(() => _rememberMe = v),
                      ),
                      const SizedBox(width: 10),
                      Text('Remember me',
                          style: AppText.inter(12,
                              color: AppColors.textSecondary)),
                      const Spacer(),
                      // No "forgot password" screen exists in the five designs.
                      Text('Forgot password?',
                          style: AppText.inter(12,
                              weight: FontWeight.w600, color: AppColors.cyan)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GradientButton(
                    text: 'Sign In to CarHub',
                    onPressed: () {
                      // TODO: real sign-in goes here later (no backend yet).
                    },
                  ),
                  const SizedBox(height: 14),
                  const SocialSection(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text.rich(
                TextSpan(
                  style: AppText.inter(9.5, color: AppColors.textMuted),
                  children: [
                    const TextSpan(text: "By continuing, you agree to CarHub's "),
                    TextSpan(
                        text: 'Terms of Service',
                        style: AppText.inter(9.5,
                            color: AppColors.textSecondary)
                            .copyWith(decoration: TextDecoration.underline)),
                    const TextSpan(text: ' and '),
                    TextSpan(
                        text: 'Privacy Policy',
                        style: AppText.inter(9.5,
                            color: AppColors.textSecondary)
                            .copyWith(decoration: TextDecoration.underline)),
                    const TextSpan(text: '.'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
