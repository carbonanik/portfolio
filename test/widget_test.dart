import 'package:flutter/material.dart';

void main() {
  final color = Color(0x00ff00);
  print(color.value);
  final value = color.value;
  final color2 = Color(value);
  print(color2);
}
