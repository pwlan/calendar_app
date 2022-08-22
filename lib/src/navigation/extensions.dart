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

extension RouteExtensions on String {
  page(GoRouterWidgetBuilder builder) => GoRoute(
      path: this,
      pageBuilder: (context, state) => MaterialPage<void>(child: builder(context, state)));

  route(GoRouterWidgetBuilder builder) => GoRoute(path: this, builder: builder);
}

typedef GoRouterWidgetBuilder = Widget Function(
    BuildContext context, GoRouterState state);

typedef GoRouterPageBuilder = Page<void> Function(
    BuildContext context, GoRouterState state);

extension RoutesExtensions on List<GoRoute> {
  routes() => GoRouter(routes: this);
}

