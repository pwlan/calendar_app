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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhysicalShape(
            elevation: 5.0,
            clipper: BigAppBarClipper(),
            color: Colors.orange,
            child: Container(width: double.infinity, height: 200),
          ),
          PhysicalShape(
            elevation: 5.0,
            clipper: AppBarClipper(),
            color: Colors.pink,
            child: Container(width: double.infinity, height: 200),
          ),
        ],
      ),
    );
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final controlPoint = Offset((size.width / 2), 125);
    final endPoint = Offset((size.width / 2) + 75, 50);
    //   final controlPoint01 = Offset(225, 150);
    //   final endPoint02 = Offset(300, 50);

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, 50)
      ..lineTo((size.width / 2) - 75, 50)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 50)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BigAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final controlPoint = Offset(75, 150);
    final endPoint = Offset(150, 70);
    //   final controlPoint01 = Offset(225, 150);
    //   final endPoint02 = Offset(300, 50);

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, 70)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 70)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
