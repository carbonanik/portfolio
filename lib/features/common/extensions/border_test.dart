import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  testBorder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(.3),
        border: Border.all(
          color: Colors.red,
        )
      ),
      child: this,
    );
  }
}
