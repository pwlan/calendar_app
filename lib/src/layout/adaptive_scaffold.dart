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
import '../navigation/drawer_navigation.dart';

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold(
      {super.key,
      required this.title,
      required this.body,
      this.floatingActionButton});

  final Widget title;
  final Widget body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile();

    return Scaffold(
      appBar: AppBar(
        centerTitle: isMobile ? null : false,
        title: title,
      ),
      floatingActionButton: floatingActionButton,
      drawer: context.isMobile() ? const DrawerNavigation() : null,
      body: body,
    );
  }
}
