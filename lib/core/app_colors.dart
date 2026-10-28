import 'package:flutter/material.dart';

/// All colors used by the five CarHub screens in one place.
/// Values marked (sampled) were read from pixels of your exported screenshots.
/// Values marked (assumed) come from your earlier analysis / visual estimate.
class AppColors {
  AppColors._(); // not meant to be instantiated

  // Backgrounds
  static const background = Color(0xFF0B0E14); // (sampled, onboarding 1)

  // Text
  static const textPrimary = Color(0xFFF2F7FA); // (sampled)
  static const textSecondary = Color(0xFF8B98A7); // (assumed)
  static const textMuted = Color(0xFF6B7684); // (assumed) small labels, footer
  static const textDark = Color(0xFF0B0E14); // text on cyan buttons

  // Accent
  static const cyan = Color(0xFF00E5FF); // (sampled)
  static const success = Color(0xFF49DF98); // (sampled) password strength

  // Surfaces and borders
  static const card = Color(0xFF161B22); // (sampled, sign up fields)
  static const border = Color(0xFF30363D); // (sampled)
  static const divider = Color(0xFF252C34); // (sampled, sign up row separators)
  static const inputFill = Color(0xFF11161D); // (sampled, log in fields)
  static const authCardTop = Color(0xFF1C232B); // (sampled)
  static const authCardBottom = Color(0xFF171D24); // (sampled)
  static const tabTrack = Color(0xFF0D1117); // (assumed)
  static const tabSelected = Color(0xFF1C232B); // (sampled)
  static const socialButtonFill = Color(0xFF12171E); // (sampled)

  // Onboarding page dots
  static const dotOff = Color(0xFF2C353E); // (sampled)

  // Buttons
  static const buttonGradientStart = Color(0xFF05D0EB); // (sampled)
  static const buttonGradientEnd = Color(0xFF42EDFE); // (sampled)
  static const buttonBottomEdge = Color(0xFF25BCCD); // (sampled)
  static const arrowBox = Color(0x1A000000); // black at 10% (estimated)

  // Glows and shadows (alpha is the first two hex digits)
  static const cyanGlow = Color(0x4D00E5FF); // cyan at 30%
  static const logoGlow = Color(0x3300E5FF); // cyan at 20%
  static const cardShadow = Color(0x66000000); // black at 40%
}
