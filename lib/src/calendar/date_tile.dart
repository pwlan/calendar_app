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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calendar_app/src/calendar/state/date.dart';
import 'package:calendar_app/src/core/extensions.dart';
import 'package:calendar_app/src/core/views/extensions.dart';

import '../events/event_list_dialog.dart';
import '../events/state/events.dart';

class DateTile extends StatelessWidget {
  const DateTile({super.key, required this.entry});

  final CalendarEntry entry;

  @override
  Widget build(BuildContext context) {
    final allEvents = context
        .select<Events, List<Event>>((events) => events.find(entry.date));

    return Container(
      decoration: BoxDecoration(
        color: entry.today
            ? context.colorScheme.surfaceVariant
            : context.colorScheme.background,
        border: Border.all(color: context.colorScheme.background),
      ),
      child: allEvents.isNotEmpty
          ? _buildWithEvents(allEvents, context).padding(4)
          : Text('${entry.date.day}').padding(4),
    );
  }

  Widget _buildWithEvents(List<Event> allEvents, BuildContext context) {
    final events = allEvents.take(3);
    final overflow = allEvents.length > 3;

    return GestureDetector(
      onTap: () {
        showEventListDialog(allEvents, context);
      },
      child: FocusableActionDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${entry.date.day}'),
            const SizedBox(height: 4),
            for (var e in events) EventLabel(event: e).padding(1),
            if (overflow) const MoreLabel(),
          ],
        ),
      ),
    );
  }

  @override
  debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('myProperty', 'Hi!'));
  }
}

class EventLabel extends StatelessWidget {
  const EventLabel({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Chip(
      // deleteIcon: Icon(Icons.cancel),
      // onDeleted: (){},
      padding: const EdgeInsets.all(0),
      label: Text(
        '${event.date.toTimeString()} ${event.title}',
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      backgroundColor: context.colorScheme.secondary,
    );
  }
}

class MoreLabel extends StatelessWidget {
  const MoreLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Chip(
      padding: EdgeInsets.all(0),
      label: Text(' ... '),
    );
  }
}
