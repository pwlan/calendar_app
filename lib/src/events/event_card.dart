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
import 'package:provider/provider.dart';
import 'package:calendar_app/src/core/extensions.dart';
import 'package:calendar_app/src/events/state/events.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(event.date.toDateString()),
            IconButton(
                onPressed: () {
                  context.read<EventsNotifier>().remove(event);
                },
                icon: Icon(Icons.delete))
          ],
        ),
        title: Text(event.title),
        subtitle: Text(event.description),
        leading: Text(event.date.toTimeString()),
      ),
    );
  }
}
