import 'package:flutter/material.dart';

TextStyle bigTitleTwo = const TextStyle(
  fontFamily: "Cabin",
  fontSize: 48,
  fontWeight: FontWeight.w800,
  height: 1,
);

TextStyle subtitleStyle (BuildContext context) => TextStyle(
    fontFamily: "Cabin",
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1,
    color: Theme.of(context).colorScheme.primary);

TextStyle basicStyle (BuildContext context) => TextStyle(
      fontFamily: "Cabin",
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.inversePrimary,
// height: 2
    );

InputDecoration inputUnderlineStyle (BuildContext context) => InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary.withOpacity(.05)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
    );
