// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calendar_app/src/app.dart';
import 'package:calendar_app/src/events/event_form.dart';
import 'package:calendar_app/src/events/state/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calendar_app/main.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MultiProvider(
      providers: [
        StateNotifierProvider<EventsNotifier, Events>(
          create: (_) => EventsNotifier(),
        ),
      ],
      builder: (context, _) => const CalendarApp(),
    ));

    // Verify
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byType(EventForm), findsNothing);

    // Tap FloatingActionButton
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    // Verify EventForm
    expect(find.byType(EventForm), findsOneWidget);
  });
}
