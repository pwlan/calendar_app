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
import 'package:go_router/go_router.dart';
import 'package:calendar_app/src/calendar/calendar_screen.dart';
import 'package:calendar_app/src/events/events_screen.dart';
import 'package:calendar_app/src/layout/main_layout.dart';
import 'package:calendar_app/src/navigation/extensions.dart';
import 'package:calendar_app/src/navigation/navigation.dart';

final navigation = [
  NavigationItem(title: 'Calendar', route: '/', icon: Icons.tab),
  NavigationItem(
      title: 'Events', route: '/events', icon: Icons.access_alarm_sharp),
];

final routes = <GoRoute>[
  '/'.route(
    (context, state) => const MainLayout(
      selectedIndex: 0,
      child: CalendarScreen(),
    ),
  ),
  '/events'.route(
    (context, state) => const MainLayout(
      selectedIndex: 1,
      child: EventsScreen(),
    ),
  ),
].routes();
