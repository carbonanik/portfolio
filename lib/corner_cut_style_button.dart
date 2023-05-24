import 'package:flutter/material.dart';
import 'package:portfolio/common/colors.dart';
import 'package:supercharged/supercharged.dart';

class CornerCutStyleButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;

  CornerCutStyleButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<CornerCutStyleButton> createState() => _CornerCutStyleButtonState();
}

class _CornerCutStyleButtonState extends State<CornerCutStyleButton> {
  Size? cardSize;
  Offset? cardPosition;
  bool hovered = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getSizeAndPosition();
    });
  }

  getSizeAndPosition() {
    RenderBox? _cardBox =
        _cardKey.currentContext?.findRenderObject() as RenderBox;
    cardSize = _cardBox.size;
    cardPosition = _cardBox.localToGlobal(Offset.zero);
    print(cardSize);
    print(cardPosition);
    setState(() {});
  }

  final GlobalKey _cardKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: cardSize?.width != null ? cardSize!.width + 10 : null,
        ),
        Stack(
          children: [
            AnimatedContainer(
              duration: 50.milliseconds,
              margin: EdgeInsets.only(
                top: hovered ? 0 : 10,
                left: hovered ? 0 : 10,
              ),
              decoration: BoxDecoration(
                // color: Colors.green,
                border: Border(
                  bottom: BorderSide(
                    color: textColorLite.withOpacity(.5),
                    width: hovered ? 1 : 3,
                  ),
                  right: BorderSide(
                    color: textColorLite.withOpacity(.5),
                    width: hovered ? 1 : 3,
                  ),
                ),
              ),
              height: cardSize?.height,
              width: cardSize?.width,
            ),
            // Positioned.fill(
            //   child: Transform(
            //     transform: Matrix4.translationValues(10, 10, 0),
            //     child: AnimatedContainer(
            //       duration: 50.milliseconds,
            //       margin: EdgeInsets.only(
            //           right: widget.hover ? 10 : 0,
            //           bottom: widget.hover ? 10 : 0,
            //           top: 0,
            //           left: 0),
            //       decoration: BoxDecoration(
            //         border: Border(
            //           top: BorderSide(width: 0),
            //           left: BorderSide(width: 0),
            //           right: BorderSide(
            //               color: textColorDark.withOpacity(.5),
            //               width: widget.hover ? 0 : 10),
            //           bottom: BorderSide(
            //               color: textColorDark.withOpacity(.5),
            //               width: widget.hover ? 0 : 10),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            //
            TextButton(
              key: _cardKey,
              onPressed: () {
                print("Click Me!");
                widget.onTap?.call();
              },
              onHover: (hover) {
                hovered = hover;
                setState(() {});
              },
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(
                    Colors.yellow[900]!.withOpacity(.05)),
                shape: MaterialStateProperty.all(
                  const BeveledRectangleBorder(
                    side: BorderSide(color: textColorDark),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      // bottomRight: Radius.circular(18.0)
                    ),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 22,
                    color: textColorDark,
                    fontFamily: "IBMPlexMono",
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
