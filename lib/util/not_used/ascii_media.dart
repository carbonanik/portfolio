import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:image/image.dart' as img;
import 'package:portfolio/gen/fonts.gen.dart';
import 'package:portfolio/theme/colors.dart';

class AsciiMedia extends StatefulWidget {
  const AsciiMedia({Key? key}) : super(key: key);

  @override
  State<AsciiMedia> createState() => _AsciiMediaState();
}

class _AsciiMediaState extends State<AsciiMedia> {
  final density = "Ñ@#W\$9876543210?!abc;:+=-,._ ";

  // List<List<img.Pixel?>>? im;
  img.Image? imageData;

  Future<void> getImagePixelGrid(String imagePath) async {
    // Load the image
    ByteData data = await rootBundle.load(imagePath);
    Uint8List uint8List = data.buffer.asUint8List();
    img.Image? image = img.decodeImage(uint8List);
    imageData = image;

    // Get pixel data
    // List<List<img.Pixel?>> pixelGrid = [];
    //
    // for (int y = 0; y < (image?.height ?? 0); y++) {
    //   List<img.Pixel?> row = [];
    //   for (int x = 0; x < (image?.width ?? 0); x++) {
    //     img.Pixel? pixel = image?.getPixel(x, y);
    //     row.add(pixel);
    //   }
    //   pixelGrid.add(row);
    // }
    // print(pixelGrid[50][80]);
    // im = pixelGrid;
    setState(() {});
    // return pixelGrid;
  }

  int rgbToGray(int red, int green, int blue) {
    return (0.299 * red + 0.587 * green + 0.114 * blue).round();
  }

  int mapToNewRange(int originalValue) {
    int oldMin = 0;
    int oldMax = 255;
    int newMin = 0;
    int newMax = density.length - 1;

    // Perform linear mapping
    int mappedValue = (((originalValue - oldMin) * (newMax - newMin)) ~/ (oldMax - oldMin)) + newMin;

    return mappedValue;
  }

  @override
  Widget build(BuildContext context) {
    getImagePixelGrid(Assets.image.apple.path);
    String text = "";
    for (int i = 0; i < (imageData?.height ?? 0); i++) {
      for (int j = 0; j < (imageData?.width ?? 0); j++) {
        final pixel = imageData?.getPixel(j, i);
        text += (pixel?.r ?? 0) > 245 ? " " : density[mapToNewRange(pixel?.r.toInt() ?? 0)];
      }
      text += "\n";
    }
    return Scaffold(
      backgroundColor: appColors.backgroundColor,
      body: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: FontFamily.iBMPlexMono,
            fontSize: 8,
            letterSpacing: 4.0,
            color: appColors.accentColor,
          ),
          softWrap: false,
        ),
      ),
    );

    //   Column(
    //   children: List.generate(
    //     im?.length ?? 0,
    //     (i1) => Row(
    //       children: List.generate(
    //         im?[i1].length ?? 0,
    //         (i2) {
    //           final grey = rgbToGray(
    //             im?[i1][i2]?.r.toInt() ?? 0,
    //             im?[i1][i2]?.g.toInt() ?? 0,
    //             im?[i1][i2]?.b.toInt() ?? 0,
    //           );
    //           return Text(
    //             density[mapToNewRange(grey)],
    //             style: const TextStyle(
    //               fontFamily: FontFamily.iBMPlexMono,
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
