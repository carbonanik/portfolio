import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';

class CustomGallery extends StatefulWidget {
  const CustomGallery({super.key});

  @override
  State<CustomGallery> createState() => _GalleryState();
}

class _GalleryState extends State<CustomGallery> {
  List<String> imageUrlList = [
    "assets/image/mock_app_ui.png",
    "assets/image/mock_app_ui.png",
    "assets/image/mock_app_ui.png",
    "assets/image/mock_app_ui.png",
    "assets/image/mock_app_ui.png",
    "assets/image/mock_app_ui.png",
  ];

  int currentIndex = 0;

  late Gallery3DController controller;

  @override
  void initState() {
    controller = Gallery3DController(itemCount: imageUrlList.length, autoLoop: true, ellipseHeight: 0, minScale: 0.2);
    super.initState();
  }

  Widget buildGallery3D() {
    return Gallery3D(
        controller: controller,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        itemConfig: const GalleryItemConfig(
          width: 180,
          height: 300,
          radius: 10,
        ),
        width: 500,
        height: 320,
        isClip: true,
        onClickItem: (index) {
          if (kDebugMode) print("currentIndex:$index");
        },
        itemBuilder: (context, index) {
          return Image(
            fit: BoxFit.fill,
            image: AssetImage(
              imageUrlList[index],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      padding: const EdgeInsets.only(top: 20),
      child: buildGallery3D(),
    );
  }
}
