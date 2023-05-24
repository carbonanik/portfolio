import 'dart:math';

import 'package:collection/collection.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import '../colors.dart';

class SocialColumn extends StatelessWidget {
  const SocialColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const socialItems = ["gh.", "in.", "tw.", "fb.", "em."]; //em = email
    const socialIcons = [
      EvaIcons.github,
      EvaIcons.linkedin,
      EvaIcons.twitter,
      EvaIcons.facebook,
      Icons.email_rounded
    ];

    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 1.2,
      padding: const EdgeInsets.only(bottom: 10),
      color: textColorDark.withOpacity(.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: IterableZip([socialItems, socialIcons])
            .map((zip) => VerticalSocialItem(zip: zip))
            .toList(),
      ),
    );
  }
}

class VerticalSocialItem extends StatefulWidget {
  final List zip;

  const VerticalSocialItem({Key? key, required this.zip}) : super(key: key);

  @override
  State<VerticalSocialItem> createState() => _VerticalSocialItemState();
}

class _VerticalSocialItemState extends State<VerticalSocialItem> {
  bool hovred = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
          padding: const EdgeInsets.only(right: 38.0),
          child: TextButton(
            onPressed: () {},
            onHover: (hover) {
              hovred = hover;
              setState(() {});
            },
            child: AnimatedSwitcher(
              duration: 100.milliseconds,
              child: hovred
                  ? Transform.scale(
                      scale: 2,
                      child: Icon(
                        widget.zip[1],
                        color: textColorLite,
                      ),
                    )
                  : Text(
                      widget.zip[0],
                      style: const TextStyle(
                          fontFamily: "IBMPlexMono",
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: backgroundColor
                          // height: 2
                          ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}


class SwitchButton extends StatefulWidget {
  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool enableSwitch = false;

  void _toggle() {
    setState(() {
      enableSwitch = !enableSwitch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: GestureDetector(
        onTap: _toggle,
        behavior: HitTestBehavior.translucent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10,),
              const SizedBox(height: 10,),
              CustomSwitch(switched: enableSwitch),

            ],
          ),
        ),
      ),
    );
  }

}

enum _SwitchBoxProps { paddingLeft, color, text, rotation }


class CustomSwitch extends StatelessWidget {
  final bool switched;

  const CustomSwitch({super.key, required this.switched});

  @override
  Widget build(BuildContext context) {
    var tween = MultiTween<_SwitchBoxProps>()
      ..add(_SwitchBoxProps.paddingLeft, 0.0.tweenTo(60.0), 1.seconds)
      ..add(_SwitchBoxProps.color, Colors.red.tweenTo(Colors.blue), 1.seconds)
      ..add(_SwitchBoxProps.text, ConstantTween("OFF"), 500.milliseconds)
      ..add(_SwitchBoxProps.text, ConstantTween("ON"), 500.milliseconds)
      ..add(_SwitchBoxProps.rotation, (-2.0 * pi).tweenTo(0.0), 1.seconds);

    return CustomAnimation<MultiTweenValues<_SwitchBoxProps>>(
      control: switched
          ? CustomAnimationControl.play
          : CustomAnimationControl.playReverse,
      startPosition: switched ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildSwitchBox,
    );
  }

  Widget _buildSwitchBox(
      context, child, MultiTweenValues<_SwitchBoxProps> value) {
    return Container(
      decoration: _outerBoxDecoration(value.get(_SwitchBoxProps.color)),
      width: 100,
      height: 40,
      padding: const EdgeInsets.all(3.0),
      child: Stack(
        children: [
          Positioned(
              child: Padding(
                padding:
                EdgeInsets.only(left: value.get(_SwitchBoxProps.paddingLeft)),
                child: Transform.rotate(
                  angle: value.get(_SwitchBoxProps.rotation),
                  child: Container(
                    decoration:
                    _innerBoxDecoration(value.get(_SwitchBoxProps.color)),
                    width: 30,
                    child: Center(
                        child: Text(value.get(_SwitchBoxProps.text),
                            style: labelStyle)),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  BoxDecoration _innerBoxDecoration(Color color) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(25)), color: color);

  BoxDecoration _outerBoxDecoration(Color color) => BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(30)),
    border: Border.all(
      width: 2,
      color: color,
    ),
  );

  static const labelStyle = TextStyle(
      height: 1.3,
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.white);
}
