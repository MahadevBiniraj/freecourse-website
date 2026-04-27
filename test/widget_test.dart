import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_builders/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioBuildersApp());

    // Verify that the Hero section text is present.
    expect(find.textContaining('Upskill'), findsOneWidget);
  });
}
