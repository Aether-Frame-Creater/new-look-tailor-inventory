import 'package:flutter/material.dart';

/// Brand palette for New Look Tailor.
///
/// Navy carries the brand (app bars, primary buttons, headings); gold is an
/// accent only — icons, the selected navigation indicator and highlights.
/// Gold is never used as a text colour or as a button background behind white
/// text: against white it only reaches 2.4:1, well under the 4.5:1 that body
/// text needs. On navy it reaches 7.0:1, so gold-on-navy is safe.
abstract final class AppColors {
  /// Primary brand navy.
  static const navy = Color(0xFF0D1B3E);
  static const navyLight = Color(0xFF1D2F5C);
  static const navyDark = Color(0xFF060E22);

  /// Accent gold. Decorative use only (see class docs).
  static const gold = Color(0xFFC9A227);

  /// Darkened gold, usable for text/icons on light surfaces (4.7:1 on the light surface).
  static const goldDeep = Color(0xFF8A6D10);

  /// Lightened gold for text/icons on the navy surfaces of the dark theme.
  static const goldSoft = Color(0xFFE5C65C);

  static const surfaceLight = Color(0xFFFBFAF7);
  static const surfaceDark = Color(0xFF11131A);

  static const success = Color(0xFF1B7F4B);
  static const warning = Color(0xFFB4690E);
  static const danger = Color(0xFFB3261E);
}
