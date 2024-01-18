// import 'dart:async';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:matrix4_transform/matrix4_transform.dart';
// import 'package:portfolio/common/page_container.dart';
// import 'package:portfolio/common/paths/dotted_circle_painter.dart';
// import 'package:portfolio/common/widget/project_item.dart';
// import 'package:portfolio/page/menu/work/work_page.dart';
// import 'package:portfolio/theme/colors.dart';
// import 'package:sa4_migration_kit/timeline_tween/timeline_tween.dart';
// import 'package:supercharged/supercharged.dart';
//
// enum _AnimProps {
//   leftOffsetAnimation,
//   leftFadeAnimation,
//   leftScaleAnimation,
//   //
//   rightOffsetAnimation,
//   rightFadeAnimation,
//   rightScaleAnimation,
//   // button button
//   buttonTransition,
//
//   // line appear
//   lineTransition,
//   // branch appear
//   branchTransition,
// }
//
// class WorkPage extends StatefulWidget {
//   const WorkPage({Key? key}) : super(key: key);
//
//   @override
//   State<WorkPage> createState() => _WorkPageState();
// }
//
// class _WorkPageState extends State<WorkPage> with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late AnimationController _nextButtonController;
//
//   late Animation<TimelineValue<_AnimProps>> animation;
//   bool isLoading = false;
//   final borderColor = Theme.of(context).colorScheme.primary; //const Color(0xFF382A04);
//   final lineColor = Theme.of(context).colorScheme.primary; //const Color(0xFF382A04);///backgroundTextColor;
//   final lineWidth = 1.0;
//   BlobHoverData blobHoverData = const BlobHoverData.initial();
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(duration: 1000.milliseconds, vsync: this);
//     _nextButtonController = AnimationController(duration: 10.seconds, vsync: this);
//
//     _nextButtonController.repeat();
//
//     animation = TimelineTween<_AnimProps>()
//
//         // left side
//         .addScene(begin: 0.milliseconds, end: 100.milliseconds, curve: Curves.ease)
//         .animate(_AnimProps.leftOffsetAnimation, tween: Tween(begin: const Offset(-200, -100), end: Offset.zero))
//         .animate(_AnimProps.leftFadeAnimation, tween: Tween(begin: 0.0, end: 1.0))
//         .animate(_AnimProps.leftScaleAnimation, tween: Tween(begin: 0.9, end: 1.0))
//
//         // right side
//         .addSubsequentScene(delay: -70.milliseconds, duration: 100.milliseconds, curve: Curves.ease)
//         .animate(_AnimProps.rightOffsetAnimation, tween: Tween(begin: const Offset(200, 100), end: Offset.zero))
//         .animate(_AnimProps.rightFadeAnimation, tween: Tween(begin: 0.0, end: 1.0))
//         .animate(_AnimProps.rightScaleAnimation, tween: Tween(begin: 0.9, end: 1.0))
//
//         // Button
//         .addSubsequentScene(delay: 50.milliseconds, duration: 100.milliseconds, curve: Curves.ease)
//         .animate(_AnimProps.buttonTransition, tween: Tween(begin: const Offset(0, 200), end: Offset.zero))
//
//         //line transition
//         .addSubsequentScene(delay: 50.milliseconds, duration: 200.milliseconds, curve: Curves.ease)
//         .animate(_AnimProps.lineTransition, tween: Tween(begin: 0, end: 1))
//
//         // branch
//         .addSubsequentScene(delay: 50.milliseconds, duration: 200.milliseconds, curve: Curves.ease)
//         .animate(_AnimProps.branchTransition, tween: Tween(begin: 0, end: 1))
//
//         //
//         .parent
//         .animatedBy(_controller);
//
//     Timer(700.milliseconds, () {
//       _controller.forward();
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//     _nextButtonController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final isSingleItem = width < 1600;
//     final branchWidth = max(0.0, (width - 440 * 2) / 6);
//
//     /// 440 => item width
//     /// 2 => 2 item
//     /// 6 => 1/2 of 1 of 3 space around the 2 items
//
//     return MenuContentPage(
//       blobHoverData: blobHoverData,
//       showClock: false,
//       menuItem: 'Work',
//       isLoading: isLoading,
//       children: [
//         Positioned(
//           bottom: 80 + 70,
//           child: buildMiddleLine(
//             height - 300,
//             branchWidth,
//           ),
//         ),
//         buildAnimatedProjectList(isSingleItem),
//         Positioned(
//           bottom: 80,
//           child: buildAnimatedNextButton(),
//         ),
//       ],
//     );
//   }
//
//   Widget buildAnimatedNextButton() {
//     return AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Container(
//             height: 70,
//             width: 70,
//             transform: Matrix4Transform().translateOffset(animation.value.get(_AnimProps.buttonTransition)).matrix4,
//             child: Stack(
//               children: [
//                 AnimatedBuilder(
//                     animation: _nextButtonController,
//                     builder: (context, child) {
//                       return Transform.rotate(
//                         angle: _nextButtonController.value * 2.0 * pi,
//                         child: CustomPaint(
//                           painter: DottedCirclePainter(),
//                           child: Container(),
//                         ),
//                       );
//                     }),
//                 MouseRegion(
//                   onEnter: (_) {
//                     _nextButtonController.duration = 2.seconds;
//                     _nextButtonController.repeat();
//                   },
//                   onExit: (_) {
//                     _nextButtonController.duration = 10.seconds;
//                     _nextButtonController.repeat();
//                   },
//                   child: RawMaterialButton(
//                     onPressed: () {
//                       _controller.reverse();
//                       Timer(1000.milliseconds, () {
//                         // isLoading = true;
//                         // setState(() {});
//                         Timer(1000.milliseconds, () {
//                           // isLoading = false;
//                           // setState(() {});
//                           Timer(500.milliseconds, () {
//                             _controller.forward();
//                           });
//                         });
//                       });
//                     },
//                     elevation: 2.0,
//                     fillColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
//                     padding: const EdgeInsets.all(18.0),
//                     shape: const CircleBorder(),
//                     child: Icon(
//                       Icons.keyboard_double_arrow_down_rounded,
//                       size: 35.0,
//                       color: Theme.of(context).colorScheme.primary,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
//
//   Widget buildMiddleLine(
//     double lineHeight,
//     double branchWidth,
//   ) {
//     return AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     width: branchWidth * animation.value.get(_AnimProps.branchTransition),
//                     height: lineWidth,
//                     color: lineColor,
//                   ),
//                   const SizedBox(height: 505),
//                 ],
//               ),
//               Container(
//                 width: lineWidth,
//                 height: lineHeight * animation.value.get(_AnimProps.lineTransition),
//                 color: lineColor,
//               ),
//               Column(
//                 children: [
//                   Container(
//                     width: branchWidth * animation.value.get(_AnimProps.branchTransition),
//                     height: lineWidth,
//                     color: lineColor,
//                   ),
//                   const SizedBox(height: 390),
//                 ],
//               ),
//             ],
//           );
//         });
//   }
//
//   Widget buildAnimatedProjectItem(bool leftItem) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Opacity(
//               opacity: animation.value.get(
//                 leftItem ? _AnimProps.leftFadeAnimation : _AnimProps.rightFadeAnimation,
//               ),
//               child: Container(
//                 // padding:
//                 //     leftItem ? const EdgeInsets.only(bottom: 120, right: 60) : const EdgeInsets.only(top: 60, left: 20),
//                 transform: Matrix4Transform()
//                     .scale(
//                       animation.value.get(
//                         leftItem ? _AnimProps.leftScaleAnimation : _AnimProps.rightScaleAnimation,
//                       ),
//                     )
//                     .translateOffset(
//                       animation.value.get(
//                         leftItem ? _AnimProps.leftOffsetAnimation : _AnimProps.rightOffsetAnimation,
//                       ),
//                     )
//                     .matrix4,
//                 child: ProjectItem(
//                   leftItem: leftItem,
//                   borderColor: borderColor,
//                   project: categories[0].projects[0],
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget buildAnimatedProjectList(bool isSingleItem) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Opacity(
//               opacity: animation.value.get(_AnimProps.leftFadeAnimation),
//               child: Container(
//                 padding: const EdgeInsets.only(
//                   bottom: 120,
//                   // right: 60,
//                 ),
//                 transform: Matrix4Transform()
//                     .scale(animation.value.get(_AnimProps.leftScaleAnimation))
//                     .translateOffset(animation.value.get(_AnimProps.leftOffsetAnimation))
//                     .matrix4,
//                 child: ProjectItem(
//                   borderColor: borderColor,
//                   project: categories[0].projects[0],
//                 ),
//               ),
//             ),
//             Opacity(
//               opacity: animation.value.get(_AnimProps.rightFadeAnimation),
//               child: Container(
//                 padding: const EdgeInsets.only(
//                   top: 120,
//                   // left: 20,
//                 ),
//                 transform: Matrix4Transform()
//                     .scale(animation.value.get(_AnimProps.rightScaleAnimation))
//                     .translateOffset(animation.value.get(_AnimProps.rightOffsetAnimation))
//                     .matrix4,
//                 child: ProjectItem(
//                     borderColor: borderColor,
//                     project: categories[0].projects[1],
//                     leftItem: false,
//                     blobHoverEffect: (data) {
//                       setState(() {
//                         blobHoverData = data;
//                       });
//                     }),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
