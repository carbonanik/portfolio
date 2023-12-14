import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/features/basics/about/about_page.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/text_background.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  void initState() {
    super.initState();
    Timer(2.seconds, () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const AboutPage(),
            transitionDuration: 500.milliseconds,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const curve = Curves.ease;

              var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

              return FadeTransition(
                opacity: animation.drive(tween),
                child: child,
              );
            }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const TextBackground(),
          const ColumnOfRowBox(),
          Center(
            child: TweenAnimationBuilder(
              tween: ColorTween(
                begin: appColors.backgroundColor,
                end: appColors.accentColor,
              ),
              duration: 1.seconds,
              builder: (BuildContext context, Color? color, __) {
                return Text(
                  "Know me,",
                  style: titleTwoTextStyle.copyWith(fontSize: 200, color: color),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ColumnOfRowBox extends StatelessWidget {
  const ColumnOfRowBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int columnBoxCount = MediaQuery.of(context).size.height ~/ 100;
    final int rowBoxCount = MediaQuery.of(context).size.width ~/ 100;

    final int boxHeight = MediaQuery.of(context).size.height ~/ columnBoxCount;
    final int boxWidth = MediaQuery.of(context).size.width ~/ rowBoxCount;

    final biggerBoxCount = takeBigger(columnBoxCount, rowBoxCount);

    // final int disappearStep = 0;//biggerBoxCount * 2

    return TweenAnimationBuilder(
      // child: ,
      tween: IntTween(begin: 0, end: biggerBoxCount * 2),
      duration: 2.seconds,
      builder: (BuildContext context, int disappearStep, __) {
        return Column(
          children: List.generate(
            columnBoxCount,
            (index) => RowOfBox(
              boxHeight: boxHeight,
              boxReduce: minZero(index - columnBoxCount + disappearStep),
              boxWidth: boxWidth,
              rowBoxCount: rowBoxCount,
            ),
          ),
        );
      },
    );
  }
}

class RowOfBox extends StatefulWidget {
  final int boxHeight;
  final int boxWidth;
  final int rowBoxCount;
  final int boxReduce;
  final Duration? duration;

  const RowOfBox({
    required this.boxHeight,
    required this.boxWidth,
    required this.rowBoxCount,
    this.boxReduce = 0,
    this.duration,
    Key? key,
  }) : super(key: key);

  @override
  State<RowOfBox> createState() => _RowOfBoxState();
}

class _RowOfBoxState extends State<RowOfBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        // minZero(widget.rowBoxCount - widget.boxReduce),
        widget.rowBoxCount,
        (index) => Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: AnimatedContainer(
                  duration: 400.milliseconds,
                  color: appColors.backgroundColorLite,
                  height: minZero(widget.rowBoxCount - widget.boxReduce) <= index ? 0 : widget.boxHeight.toDouble(),
                  width: minZero(widget.rowBoxCount - widget.boxReduce) <= index ? 0 : widget.boxWidth.toDouble(),
                ),
              ),
            ),
            Container(
              height: widget.boxHeight.toDouble(),
              width: widget.boxWidth.toDouble(),
              color: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

int minZero(int value) {
  return value.clamp(0, double.maxFinite.toInt());
}

int takeBigger(int value1, int value2) {
  if (value1 < value2) return value2;
  return value1;
}
