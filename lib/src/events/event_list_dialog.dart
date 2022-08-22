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
import 'package:calendar_app/src/core/extensions.dart';
import 'package:calendar_app/src/events/event_form.dart';
import 'package:calendar_app/src/events/state/events.dart';

import 'event_card.dart';

class EventListDialog extends StatelessWidget {
  const EventListDialog({super.key, required this.events});

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return context.isMobile()
        ? _buildMobileDialog(context)
        : _buildDesktopDialog(context);
  }

  _buildMobileDialog(BuildContext context) => Material(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: EventForm(
            onFinish: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      );

  _buildDesktopDialog(BuildContext context) => SimpleDialog(
        children: [
          SizedBox(
            width: 600,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return EventCard(event: event);
                      },
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('close'),
                    onPressed: (){
                       Navigator.of(context).pop();
                    },)
                ],
              ),
            ),
          ),
        ],
      );
}

showEventListDialog(List<Event> events, context) {
  showDialog(
    barrierColor: Colors.black12.withOpacity(0.6),
    context: context,
    builder: (context) {
      return EventListDialog(events: events);
    },
  );
}
