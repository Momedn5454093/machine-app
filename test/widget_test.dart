// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';
import 'package:machine_app/core/routing/app_router.dart';
import 'package:machine_app/main.dart';

void main() {
  testWidgets('Customer Churn App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(CustomerChurnApp(appRouter: AppRouter()));

    // Verify login screen is displayed
    expect(find.text('Welcome Back 👋'), findsOneWidget);
  });
}
