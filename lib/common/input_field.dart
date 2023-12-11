import 'package:flutter/material.dart';
import 'package:portfolio/ext.dart';
import 'package:portfolio/theme/colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.title,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.padding,
  }) : super(key: key);

  final String? title;
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null ? SizedBox(height: 20) : const SizedBox(),
          title != null
              ? Text(
                  title!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: appColors.accentColor,
                  ),
                )
              : const SizedBox(),
          title != null ? SizedBox(height: 10) : const SizedBox(),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,

            style: TextStyle(
              color: appColors.foregroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: context.responsiveSize(desktop:  20, tablet: 20, mobile: 10),
                vertical: context.responsiveSize(desktop:  20, tablet: 20, mobile: 10),
              ),
              hintText: hint,
              hintStyle: TextStyle(
                color: appColors.accentColor.darken(70),
                fontWeight: FontWeight.normal,
                fontSize: context.responsiveSize(desktop:  32, tablet: 32, mobile: 24),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: appColors.accentColor.darken(70),
                    width: 3,
                  )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(
                  color: appColors.accentColor.darken(30),
                  width: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
