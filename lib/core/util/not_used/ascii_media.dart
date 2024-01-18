import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:image/image.dart' as img;
import 'package:portfolio/gen/fonts.gen.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:supercharged/supercharged.dart';

class AsciiMedia extends StatefulWidget {
  const AsciiMedia({super.key});

  @override
  State<AsciiMedia> createState() => _AsciiMediaState();
}

class _AsciiMediaState extends State<AsciiMedia> {
  final density = "Ñ@#W\$9876543210?!abc;:+=-,._ "; // "Ñ@#W\$9876543210?!abc;:+=-,._ "
  List<TextSpan> text = [];
  List<TextSpan> textCopy = [];

  // late Timer timer;
  // late StreamController<int> streamController;

  Future<img.Image?> getImagePixelGrid(String imagePath) async {
    ByteData data = await rootBundle.load(imagePath);
    Uint8List uint8List = data.buffer.asUint8List();
    img.Image? image = img.decodeImage(uint8List);
    return image;
  }

  int rgbToGray(int red, int green, int blue) {
    return (0.299 * red + 0.587 * green + 0.114 * blue).round();
  }

  int mapToNewRange(int originalValue) {
    int oldMin = 0;
    int oldMax = 255;
    int newMin = 0;
    int newMax = density.length - 1;
    int mappedValue = (((originalValue - oldMin) * (newMax - newMin)) ~/ (oldMax - oldMin)) + newMin;
    return mappedValue;
  }

  List<TextSpan> imageDataToString(img.Image imageData) {
    List<TextSpan> textSpans = [];
    for (int i = 0; i < (imageData.height); i++) {
      for (int j = 0; j < (imageData.width); j++) {
        final pixel = imageData.getPixel(j, i);
        final grey = rgbToGray(pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt());
        textSpans.add(
          TextSpan(
            text: density[mapToNewRange(255 - grey).toInt()],
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary.darken(100 - grey / 255 * 100),
            ),
          ),
        );
      }
      textSpans.add(const TextSpan(text: "\n"));
    }
    return textSpans;
  }

  @override
  void initState() {
    super.initState();
    getImagePixelGrid(Assets.image.test.path).then((imageData) {
      if (imageData == null) return;
      text = imageDataToString(imageData);
      textCopy = [...text];
      setState(() {});

      // streamController = StreamController<int>();
      // final randomStream = createRandomStream();
      // randomStream.listen((value) async {
      //   print('Received value: $value');
      //   await updateGlitter();
      // });
      // timer = Timer.periodic(
      //   100.milliseconds,
      //   (timer) {
      //     setState(() {
      //       const count = 1000;
      //       text = [...textCopy];
      //       for (int i = 0; i < count; i++) {
      //         final selectedIndex = Random().nextInt(text.length);
      //         if (text[selectedIndex].text == "\n") continue;
      //         text[selectedIndex] = const TextSpan(
      //           text: " ",
      //         );
      //       }
      //     });
      //   },
      // );
    });
  }

  Future<void> updateGlitter() async {
    setState(() {
      const count = 1000;
      text = [...textCopy];
      for (int i = 0; i < count; i++) {
        final selectedIndex = Random().nextInt(text.length);
        if (text[selectedIndex].text == "\n") continue;
        text[selectedIndex] = const TextSpan(
          text: " ",
        );
      }
    });
  }

  Stream<int> createRandomStream() async* {
    while (true) {
      await Future.delayed(Duration(milliseconds: Random().nextInt(900) + 50));
      yield Random().nextInt(100);
    }
  }

  @override
  void dispose() {
    // timer.cancel();
    // streamController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: RichText(
              text: TextSpan(
                children: text,
                style: const TextStyle(
                  fontFamily: FontFamily.iBMPlexMono,
                  fontSize: 8,
                  letterSpacing: 5.0,
                ),
              ),
              softWrap: false,
            ),
          ),
          RichText(
            text: TextSpan(
              children: text,
              style: const TextStyle(
                fontFamily: FontFamily.iBMPlexMono,
                fontSize: 8,
                letterSpacing: 5.0,
              ),
            ),
            softWrap: false,
          ),
        ],
      ),
    );
  }
}
