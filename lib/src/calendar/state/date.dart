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

class CalendarEntry {
  final DateTime date;
  final bool today;

  const CalendarEntry(this.date, this.today);
}

/// Returns the dates.
List<CalendarEntry> getDates(int month, int year) {
  final today = DateTime.now();
  final result = <CalendarEntry>[];

  var next = DateTime(year, month);
  while (next.month == month) {
    result.add(CalendarEntry(
        next,
        next.day == today.day &&
            next.month == today.month &&
            next.year == today.year));
    next = next.add(const Duration(days: 1));
  }
  return result;
}
