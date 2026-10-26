import 'package:flutter/material.dart';

import '../../../core/router/placeholder_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Settings',
      icon: Icons.settings_outlined,
      message: 'Shop details, backup to Google Drive and app preferences.',
    );
  }
}
