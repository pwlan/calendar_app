/*
 * Copyright 2022: Patrick Whelan
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *          http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendar_app/src/calendar/date_tile.dart';
import 'package:calendar_app/src/calendar/state/date.dart';
import 'package:calendar_app/src/events/new_event_dialog.dart';
import 'package:calendar_app/src/layout/adaptive_scaffold.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  var currentCalendar = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final smallScreen = MediaQuery.of(context).size.width < 500;

    return AdaptiveScaffold(
      title: const Text('Calendar'),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showNewEventDialog(context);
        },
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    changeMonth(-1);
                  }),
              const SizedBox(width: 8),
              Text(DateFormat.yMMMM().format(currentCalendar),
                  style: TextStyle(fontSize: (smallScreen ? 18 : 40))),
              const SizedBox(width: 8),
              IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    changeMonth(1);
                  }),
              const SizedBox(width: 8),
              if (smallScreen) const Spacer(),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: 200,
              padding: const EdgeInsets.all(4),
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              children: getDates(currentCalendar.month, currentCalendar.year)
                  .map((e) => DateTile(entry: e))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  void changeMonth(int inc) {
    setState(() {
      currentCalendar =
          DateTime(currentCalendar.year, currentCalendar.month + inc);
    });
  }
}
