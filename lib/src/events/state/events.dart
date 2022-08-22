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
import 'package:state_notifier/state_notifier.dart';

///
/// Represents a single event in the calendar.
///
@immutable
class Event {
  const Event(
      {required this.title, required this.description, required this.date});

  final String title;
  final String description;
  final DateTime date;
}

///
/// Represents a collection of events.
///
@immutable
class Events {
  const Events(this._items);

  final List<Event> _items;

  int get length => _items.length;

  Event get last => _items.last;

  Event get(int index) => _items[index];

  /// Finds all events on the same day as the specified date.
  List<Event> find(DateTime date) {
    final result = <Event>[];
    for (var e in _items) {
      if (e.date.isSameDay(date)) {
        result.add(e);
      }
    }
    return result;
  }

  /// Creates a new instance of Events with the specified event added.
  add(Event event) {
    final eventItems = [event, ..._items];
    eventItems.sort((a, b) => a.date.compareTo(b.date));
    return Events(eventItems);
  }

  /// Creates a new instance of Events with the specified event removed.
  remove(Event event) {
    final eventItems = [..._items];
    eventItems.remove(event);
    return Events(eventItems);
  }
}

///
/// Provides the operations to mutate events.
///
class EventsNotifier extends StateNotifier<Events> {
  EventsNotifier()
      : super(Events([
          Event(
            title: 'Birthday',
            description: 'Coming soon..',
            date: DateTime.now(),
          ),
          Event(
            title: 'Pick up Paul',
            description: 'Terminal 2',
            date: DateTime.now(),
          ),
          Event(
            title: 'Dentist',
            description: 'Remember to brush!',
            date: DateTime.now(),
          )
        ]));

  /// Adds a new event.
  addNewEvent(Event event) {
    state = state.add(event);
  }

  /// Deletes an event.
  deleteEvent(Event event) {
    state = state.remove(event);
  }

  /// Deletes the last event in the event list.
  deleteLastEvent() {
    state = state.remove(state.last);
  }
}
