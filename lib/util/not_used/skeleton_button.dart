import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';

class SkeletonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const SkeletonButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      clipBehavior: Clip.antiAlias,
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(color: appColors.accentColor),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return appColors.accentColor.withOpacity(.5);
            }
            return Colors.transparent;
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "IBMPlexMono",
            fontSize: 22,
            fontWeight: FontWeight.w400,
            height: 0,
            color: appColors.accentColor,
          ),
        ),
      ),
    );
  }
}
