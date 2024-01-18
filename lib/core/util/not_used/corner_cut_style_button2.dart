// import 'package:flutter/material.dart';
// import 'package:portfolio/core/theme/colors.dart';
// import 'package:portfolio/core/theme/typography.dart';
// import 'package:portfolio/features/common/paths/corner_cut_border_clipper.dart';
// import 'package:portfolio/features/common/extensions/ext.dart';
// import 'package:supercharged/supercharged.dart';
//
// class CornerCutButton2 extends StatefulWidget {
//
//
//   final String? text;
//   final VoidCallback? onTap;
//   final double? fontSize;
//   final bool transparent;
//   final EdgeInsets? padding;
//   final double? cornerCutRadius;
//   final double? elevation;
//
//   const CornerCutButton2({
//
//     super.key,
//     this.text,
//     this.onTap,
//     this.fontSize,
//     this.transparent = true,
//     this.padding,
//     this.cornerCutRadius,
//     this.elevation,
//   });
//
//   @override
//   State<CornerCutButton2> createState() => _CornerCutButtonState();
// }
//
// class _CornerCutButtonState extends State<CornerCutButton2> with TickerProviderStateMixin {
//   bool pointerDown = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final corner = context.adaptiveResponsiveWidth(desktop: 18, tablet: 16, mobile: 14);
//
//     return  Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Stack(
//           children: [
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: widget.transparent ? null : Theme.of(context).colorScheme.background,
//                   border: Border(
//                     bottom: BorderSide(
//                       color: Theme.of(context).colorScheme.tertiary.withOpacity(.5),
//                       width: pointerDown ? 1 : 3,
//                     ),
//                     right: BorderSide(
//                       color: Theme.of(context).colorScheme.tertiary.withOpacity(.5),
//                       width: pointerDown ? 1 : 3,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Listener(
//               onPointerDown: (_) {
//                 setState(() {
//                   pointerDown = true;
//                 });
//               },
//               onPointerUp: (_) {
//                 setState(() {
//                   pointerDown = false;
//                 });
//               },
//               child: AnimatedContainer(
//                 duration: 50.milliseconds,
//                 transform: Matrix4.translationValues(
//                   pointerDown ? 0 : -(widget.elevation ?? context.adaptiveResponsiveWidth(desktop: 10)),
//                   pointerDown ? 0 : -(widget.elevation ?? context.adaptiveResponsiveWidth(desktop: 10)),
//                   0,
//                 ),
//                 child: TextButton(
//                   onPressed: widget.onTap,
//                   style: ButtonStyle(
//                     shadowColor: MaterialStateProperty.all(Colors.white),
//                     backgroundColor: MaterialStateProperty.all(
//                       widget.transparent ? Theme.of(context).colorScheme.primary.withOpacity(.05) : Theme.of(context).colorScheme.secondary,
//                     ),
//                     shape: MaterialStateProperty.all(
//                       BeveledRectangleBorder(
//                         side: BorderSide(color: Theme.of(context).colorScheme.primary),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(widget.cornerCutRadius ?? corner),
//                         ),
//                       ),
//                     ),
//                     padding: MaterialStateProperty.all(
//                       EdgeInsets.zero,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: widget.padding ?? EdgeInsets.symmetric(
//                       vertical: context.adaptiveResponsiveHeight(desktop: 18.0),
//                       horizontal: context.adaptiveResponsiveWidth(desktop: 18.0),
//                     ),
//                     child: Text(
//                       widget.text!,
//                       style: TextStyle(
//                         fontSize: widget.fontSize ?? context.adaptiveResponsiveWidth(desktop: fontSize_22),
//                         color: Theme.of(context).colorScheme.tertiary,
//                         fontFamily: "IBMPlexMono",
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
