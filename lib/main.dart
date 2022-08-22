import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:calendar_app/src/app.dart';
import 'package:calendar_app/src/events/state/events.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        StateNotifierProvider<EventsNotifier, Events>(
          create: (_) => EventsNotifier(),
        ),
      ],
      builder: (context, _) => const CalendarApp(),
    ),
  );
}
