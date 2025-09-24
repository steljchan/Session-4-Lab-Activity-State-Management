import 'package:flutter_test/flutter_test.dart';
import 'package:ephemeral_state_codelab/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyEphemeralApp());

    // Verify that our counter starts at 0.
    expect(find.text('Counter Value: 0'), findsOneWidget);

    // Tap the 'Increment' button and trigger a frame.
    await tester.tap(find.text('Increment'));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Counter Value: 1'), findsOneWidget);

    // Tap the 'Reset' button and trigger a frame.
    await tester.tap(find.text('Reset'));
    await tester.pump();

    // Verify that counter is reset.
    expect(find.text('Counter Value: 0'), findsOneWidget);
  });
}
