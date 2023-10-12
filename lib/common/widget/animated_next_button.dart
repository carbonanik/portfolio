import 'package:flutter/material.dart';
//
// class AnimatedNextButton extends StatelessWidget {
//   const AnimatedNextButton({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: controller,
//         builder: (context, child) {
//           return Container(
//             height: 70,
//             width: 70,
//             transform: Matrix4Transform().translateOffset(animation.value.get(_AnimProps.buttonTransition)).matrix4,
//             child: Stack(
//               children: [
//                 CustomPaint(
//                   painter: DottedCirclePainter(),
//                   child: Container(),
//                 ),
//                 RawMaterialButton(
//                   onPressed: () {
//                     controller.reverse();
//                     Timer(1000.milliseconds, () {
//                       isLoading = true;
//                       setState(() {});
//                       Timer(1000.milliseconds, () {
//                         isLoading = false;
//                         setState(() {});
//                         Timer(500.milliseconds, () {
//                           controller.forward();
//                         });
//                       });
//                     });
//                   },
//                   elevation: 2.0,
//                   fillColor: accentColor.withOpacity(.1),
//                   padding: const EdgeInsets.all(18.0),
//                   shape: const CircleBorder(),
//                   child: const Icon(
//                     Icons.keyboard_double_arrow_down_rounded,
//                     size: 35.0,
//                     color: accentColor,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
