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

extension WidgetExtensions on BuildContext {
  bool isMobile() {
    final platform = Theme.of(this).platform;
    return platform == TargetPlatform.iOS || platform == TargetPlatform.android;
  }

  Screen get screen {
    final size = MediaQuery.of(this).size;

    if (size.width < 400) {
      return Screen.small;
    }
    if (size.width < 800) {
      return Screen.medium;
    }
    return Screen.large;
  }

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  T themeExtension<T>() => Theme.of(this).extension<T>()!;
}

enum Screen { small, medium, large }

extension DateTimeExtensions on DateTime {
  addTime(TimeOfDay time) => DateTime(
        year,
        month,
        day,
        time.hour,
        time.minute,
      );

  toDateString() => DateFormat.yMMMd().format(this);

  toTimeString() => DateFormat.Hm().format(this);

  isSameDay(DateTime other) =>
      other.day == day && other.month == month && other.year == year;
}

extension StringExtensions on String {
  Text get txt => Text(this);
}

extension MaterialStateSetExtensions on Set<MaterialState> {
  bool get isHovered => contains(MaterialState.hovered);
}
