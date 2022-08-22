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
import 'package:calendar_app/src/routes.dart';

class SideNavigation extends StatelessWidget {
  const SideNavigation({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: MediaQuery.of(context).size.width > 900,
      elevation: 1,
      minExtendedWidth: 180,
      destinations: navigation
          .map(
            (e) => NavigationRailDestination(
                icon: Icon(e.icon), label: Text(e.title)),
          )
          .toList(),
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        index == 0 ? context.go('/') : context.go('/events');
      },
    );
  }
}
