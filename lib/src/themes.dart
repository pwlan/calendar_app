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

///
/// Dark Theme
///
final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.orange,
    secondary: Colors.brown,
  ),
  // cardTheme: const CardTheme(color: Colors.brown),
  extensions: [
    const EventListTheme(itemColor: Colors.pink),
  ],
  useMaterial3: true,
  pageTransitionsTheme: _pageTransitionsTheme,
);

///
/// Light Theme
///
final lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
    secondary: Colors.brown,
  ),
  // cardTheme: const CardTheme(color: Colors.brown),
  extensions: [
    const EventListTheme(itemColor: Colors.pink),
  ],
  useMaterial3: true,
  pageTransitionsTheme: _pageTransitionsTheme,
);

///
/// PageTransitionsTheme
///
const _pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.linux: _NoAnimationPageTransitionsBuilder(),
    TargetPlatform.macOS: _NoAnimationPageTransitionsBuilder(),
    TargetPlatform.windows: _NoAnimationPageTransitionsBuilder(),
  },
);

class _NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const _NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

///
/// Custom Themes
///
@immutable
class EventListTheme extends ThemeExtension<EventListTheme> {
  const EventListTheme({required this.itemColor});

  final Color? itemColor;

  @override
  EventListTheme copyWith({Color? itemColor}) {
    return EventListTheme(itemColor: itemColor ?? this.itemColor);
  }

  @override
  EventListTheme lerp(ThemeExtension<EventListTheme>? other, double t) {
    if (other is! EventListTheme) {
      return this;
    }
    return EventListTheme(itemColor: Color.lerp(itemColor, other.itemColor, t));
  }

  @override
  String toString() => 'EventListTheme(brandColor: $itemColor)';
}
