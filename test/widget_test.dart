import 'package:flutter_test/flutter_test.dart';
import 'package:new_look_tailor/main.dart';

void main() {
  testWidgets('app starts on the dashboard with all five tabs', (tester) async {
    await tester.pumpWidget(const NewLookTailorApp());
    await tester.pumpAndSettle();

    // 'Dashboard' appears in the app bar, the placeholder body and the tab.
    expect(find.text('Dashboard'), findsWidgets);
    for (final label in ['Items', 'Stock', 'Reports', 'Settings']) {
      expect(find.text(label), findsWidgets, reason: 'missing $label tab');
    }
  });

  testWidgets('tapping a tab switches destination', (tester) async {
    await tester.pumpWidget(const NewLookTailorApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Items'));
    await tester.pumpAndSettle();

    expect(
      find.text(
        'Fabrics, linings, threads, buttons, zips, elastic, trims '
        'and tools.',
      ),
      findsOneWidget,
    );
  });
}
