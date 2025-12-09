import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_ccid/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('App shows environment info', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final devEnvFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Text && widget.data?.contains('Environment: dev') == true,
    );
    final apiUrlFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Text &&
          widget.data?.contains('api-dev.example.com') == true,
    );

    expect(devEnvFinder, findsWidgets);
    expect(apiUrlFinder, findsWidgets);
  });

  testWidgets('App title displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Flutter Demo Home Page'), findsWidgets);
  });

  testWidgets('FloatingActionButton exists', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Multiple counter increments', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);

    for (int i = 1; i <= 3; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('$i'), findsOneWidget);
    }
  });
}
