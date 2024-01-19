import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/ui/styles.dart';

class BlockTypeAdd extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const BlockTypeAdd({
    required this.text,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Theme.of(context).colorScheme.primary.withOpacity(.3),
          child: Text(
            text,
            style: subtitleStyle(context) ,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
