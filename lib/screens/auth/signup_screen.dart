import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_text.dart';
import '../../core/navigation.dart';
import '../../widgets/auth_card.dart';
import '../../widgets/auth_logo.dart';
import '../../widgets/auth_tab_switcher.dart';
import '../../widgets/carhub_checkbox.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/signup_fields.dart';
import '../../widgets/social_buttons.dart';
import 'login_screen.dart';

/// Sign up screen. UI only: nothing is sent anywhere.
/// The card is taller than the 852px frame in the design, so this page scrolls.
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _agreed = true; // the design shows it ticked

  @override
  Widget build(BuildContext context) {
    final linkStyle = AppText.inter(10.5,
        weight: FontWeight.w500, color: AppColors.textPrimary);

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
                    loginSelected: false,
                    loginLabel: 'Log in',
                    signupLabel: 'Sign up',
                    onLoginTap: () =>
                        replaceScreen(context, const LoginScreen()),
                    onSignupTap: () {},
                  ),
                  const SizedBox(height: 19),
                  SignupFieldGroup(
                    children: [
                      const SignupFieldRow(
                        label: 'Full Name',
                        icon: Icons.person_outline,
                        initialText: 'Mohamed Alaa',
                      ),
                      const SignupDivider(),
                      const SignupFieldRow(
                        label: 'Email Address',
                        icon: Icons.mail_outline,
                        initialText: 'mohamed@domain.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SignupDivider(),
                      const SignupFieldRow(
                        label: 'Phone Number',
                        icon: Icons.phone_outlined,
                        initialText: '100 234 5678',
                        prefix: PhoneCodePrefix(),
                        keyboardType: TextInputType.phone,
                      ),
                      const SignupDivider(),
                      const SignupFieldRow(
                        label: 'Password',
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      const PasswordStrengthBar(level: 4),
                      const SizedBox(height: 19),
                    ],
                  ),
                  const SizedBox(height: 13),
                  Row(
                    children: [
                      const SizedBox(width: 2),
                      CarHubCheckbox(
                        value: _agreed,
                        size: 24,
                        radius: 6,
                        onChanged: (v) => setState(() => _agreed = v),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            style: AppText.inter(10.5,
                                color: AppColors.textSecondary),
                            children: [
                              const TextSpan(text: 'I agree to '),
                              TextSpan(
                                  text: 'Terms & Conditions', style: linkStyle),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                  text: 'Vehicle Privacy Policy',
                                  style: linkStyle),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GradientButton(
                    text: 'Sign up to CarHub',
                    onPressed: () {
                      // TODO: real sign-up goes here later (no backend yet).
                    },
                  ),
                  const SizedBox(height: 18),
                  const SocialSection(),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
