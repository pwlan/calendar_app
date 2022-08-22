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
import 'package:calendar_app/src/navigation/side_navigation.dart';

class MainLayout extends StatelessWidget {
  const MainLayout(
      {super.key, required this.child, required this.selectedIndex});

  final Widget child;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          if(!context.isMobile()) SideNavigation(selectedIndex: selectedIndex),
          Expanded(child: child),
        ],
      ),
    );
  }
}
