import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/common/widget/subtitle.dart';
import 'package:portfolio/home_page.dart';
import 'package:supercharged/supercharged.dart';

import '../common/colors.dart';
import '../common/widget/text_background.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomePage(),
            transitionDuration: 500.milliseconds,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const curve = Curves.ease;

              var tween =
                  Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

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
                begin: backgroundColor,
                end: textColorDark,
              ),
              duration: const Duration(seconds: 1),
              builder: (BuildContext context, Color? color, __) {
                return Subtitle(
                  text: "Hi,",
                  fontSize: 200,
                  color: color!,
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
      duration: const Duration(seconds: 2),
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
  final Duration duration;

  const RowOfBox({
    required this.boxHeight,
    required this.boxWidth,
    required this.rowBoxCount,
    this.boxReduce = 0,
    this.duration = const Duration(milliseconds: 500),
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
                  duration: const Duration(milliseconds: 400),
                  color: textColorDark,
                  height: minZero(widget.rowBoxCount - widget.boxReduce) > index
                      ? widget.boxHeight.toDouble()
                      : 0,
                  width: minZero(widget.rowBoxCount - widget.boxReduce) > index
                      ? widget.boxWidth.toDouble()
                      : 0,
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
