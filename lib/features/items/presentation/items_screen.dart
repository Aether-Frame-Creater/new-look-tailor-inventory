import 'package:flutter/material.dart';

import '../../../core/router/placeholder_screen.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Items',
      icon: Icons.inventory_2_outlined,
      message:
          'Fabrics, linings, threads, buttons, zips, elastic, trims and tools.',
    );
  }
}
