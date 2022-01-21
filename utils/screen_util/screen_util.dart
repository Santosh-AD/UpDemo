library screen_util;

import 'dart:core';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
part 'screen_util_init.dart';
part 'design_size_model.dart';
part 'size_extension.dart';

class ScreenUtil extends StatefulWidget {
  final Widget child;
  final DesignSize designSize;
  const ScreenUtil({
    Key? key,
    required this.child,
    required this.designSize,
  }) : super(key: key);

  @override
  _ScreenUtil createState() => _ScreenUtil();
}

class _ScreenUtil extends State<ScreenUtil> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          calculateValues(orientation: orientation, constraints: constraints);
          return widget.child;
        });
      },
    );
  }

  calculateValues({
    required BoxConstraints constraints,
    required Orientation orientation,
  }) {
    ScreenUtilInit.init(
        constraints: constraints, designSize: widget.designSize, orientation: orientation);
  }
}
