import 'package:flutter/material.dart';

import '../../../core/router/placeholder_screen.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Reports',
      icon: Icons.bar_chart_rounded,
      message: 'Sales, purchase and stock reports, with PDF export.',
    );
  }
}
