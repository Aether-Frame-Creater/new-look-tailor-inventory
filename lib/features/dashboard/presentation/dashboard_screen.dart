import 'package:flutter/material.dart';

import '../../../core/router/placeholder_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Dashboard',
      icon: Icons.dashboard_outlined,
      message:
          'Stock value, low-stock alerts and recent activity will appear here.',
    );
  }
}
