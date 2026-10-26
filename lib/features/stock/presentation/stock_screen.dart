import 'package:flutter/material.dart';

import '../../../core/router/placeholder_screen.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Stock',
      icon: Icons.swap_vert_rounded,
      message:
          'Record stock in and stock out. Every change is logged as a transaction.',
    );
  }
}
