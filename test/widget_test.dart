import 'package:flutter/material.dart';

void main() {
  const color = Color(0x0000ff00);
  print(color.value);
  final value = color.value;
  final color2 = Color(value);
  print(color2);
}
