import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/common/styles.dart';

class BlockTypeAdd extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const BlockTypeAdd({
    required this.text,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          color: accentColor.withOpacity(.3),
          child: Text(
            text,
            style: subtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
