import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Material 3 themes for New Look Tailor.
///
/// Tuned for a non-technical owner on a phone or tablet: large readable text,
/// 56dp minimum touch targets and roomy inputs.
abstract final class AppTheme {
  /// Minimum height for anything tappable.
  static const double minTouchTarget = 56;

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isLight = brightness == Brightness.light;

    // Gold is wired in as tertiary, so Material never picks it for body text
    // or for a filled button's background.
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.navy,
      brightness: brightness,
      primary: isLight ? AppColors.navy : AppColors.navyLight,
      onPrimary: Colors.white,
      tertiary: isLight ? AppColors.goldDeep : AppColors.goldSoft,
      onTertiary: isLight ? Colors.white : AppColors.navyDark,
      error: AppColors.danger,
      surface: isLight ? AppColors.surfaceLight : AppColors.surfaceDark,
    );

    final base = ThemeData(colorScheme: scheme, useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: scheme.surface,
      textTheme: _textTheme(base.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 0,
        centerTitle: false,
        toolbarHeight: 64,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        // Accent icons read clearly on navy (7.0:1).
        actionsIconTheme: const IconThemeData(color: AppColors.gold, size: 28),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 76,
        backgroundColor: isLight ? Colors.white : AppColors.navyDark,
        elevation: 3,
        indicatorColor: AppColors.gold.withValues(alpha: isLight ? 0.28 : 0.34),
        labelTextStyle: const WidgetStatePropertyAll(
          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            size: selected ? 30 : 28,
            color: selected ? scheme.primary : scheme.onSurfaceVariant,
          );
        }),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(88, minTouchTarget),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(88, minTouchTarget),
          side: BorderSide(color: scheme.primary, width: 1.5),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(64, minTouchTarget),
          textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: AppColors.gold,
        iconSize: 30,
        extendedTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        minVerticalPadding: 14,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        subtitleTextStyle: TextStyle(fontSize: 15),
        iconColor: AppColors.navy,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 20,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        labelStyle: const TextStyle(fontSize: 17),
        hintStyle: const TextStyle(fontSize: 17),
      ),
      chipTheme: const ChipThemeData(
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        contentTextStyle: TextStyle(fontSize: 16),
      ),
      dividerTheme: const DividerThemeData(space: 1, thickness: 1),
    );
  }

  /// Bumped a step above Material defaults so the owner can read it at arm's
  /// length without system font scaling.
  static TextTheme _textTheme(TextTheme base) => base.copyWith(
    displaySmall: base.displaySmall?.copyWith(fontWeight: FontWeight.w700),
    headlineMedium: base.headlineMedium?.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: base.headlineSmall?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: base.titleLarge?.copyWith(
      fontSize: 21,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: base.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: base.bodyLarge?.copyWith(fontSize: 18, height: 1.35),
    bodyMedium: base.bodyMedium?.copyWith(fontSize: 17, height: 1.35),
    bodySmall: base.bodySmall?.copyWith(fontSize: 15),
    labelLarge: base.labelLarge?.copyWith(
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
  );
}
