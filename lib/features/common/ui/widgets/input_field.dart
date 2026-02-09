import 'package:flutter/material.dart';
import 'package:portfolio/features/common/extensions/ext.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.title,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.padding,
    this.onChanged,
  });

  final String? title;
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? padding;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null ? const SizedBox(height: 20) : const SizedBox(),
          title != null
              ? Text(
                  title!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : const SizedBox(),
          title != null ? const SizedBox(height: 10) : const SizedBox(),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
            onChanged: onChanged,
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.bold,
              fontSize: context.adaptiveResponsiveWidth(
                  desktop: 32, tablet: 32, mobile: 24),
              fontFamily: "IBMPlexMono",
              height: 1.2,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary,
              ),
              contentPadding: EdgeInsets.only(
                top: context.adaptiveResponsiveWidth(
                    desktop: 20, tablet: 20, mobile: 10),
                bottom: context.adaptiveResponsiveWidth(
                    desktop: 20, tablet: 20, mobile: 10),
                left: context.adaptiveResponsiveWidth(
                    desktop: 20, tablet: 20, mobile: 10),
                right: context.adaptiveResponsiveWidth(
                    desktop: 20, tablet: 20, mobile: 10),
              ),
              hintText: hint,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary.darken(70),
                fontWeight: FontWeight.normal,
                fontSize: context.adaptiveResponsiveWidth(
                    desktop: 32, tablet: 32, mobile: 24),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary.darken(70),
                    width: 3,
                  )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary.darken(30),
                  width: 3,
                ),
              ),
            ),
            cursorWidth: 15,
            cursorHeight: context.adaptiveResponsiveWidth(
                desktop: 32, tablet: 32, mobile: 24),
            cursorColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

// class CornerCutInputBorder extends OutlineInputBorder {
//   const CornerCutInputBorder({
//     this.filled = false,
//     this.cornerRadius = 30,
//     this.width = 3,
//     this.borderColor,
//   });
//
//   final bool filled;
//   final double cornerRadius;
//   final double width;
//   final Color? borderColor;
//
//   @override
//   void paint(
//     Canvas canvas,
//     Rect rect, {
//     double? gapStart,
//     double gapExtent = 0.0,
//     double gapPercentage = 0.0,
//     TextDirection? textDirection,
//   }) {
//     var paint = Paint();
//     paint.color = borderColor ?? Theme.of(context).colorScheme.primary;
//     paint.strokeWidth = 1.0;
//
//     double h = rect.height;
//     double w = rect.width;
//
//     Path path = Path();
//
//     path
//       ..lineTo(cornerRadius, 0)
//       ..lineTo(0, cornerRadius)
//       ..lineTo(0, h)
//       ..lineTo(w, h)
//       ..lineTo(w, 0)
//       ..lineTo(w - width, 0)
//       ..lineTo(w - width, h - width)
//       ..lineTo(width, h - width)
//       ..lineTo(width, cornerRadius + width / 2)
//       ..lineTo(cornerRadius + width / 2, width)
//       ..lineTo(w - width, width)
//       ..lineTo(w - width, 0);
//
//     canvas.drawPath(path, paint);
//   }
//
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
