
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AsciiMedia extends StatelessWidget {
  AsciiMedia({Key? key}) : super(key: key);

  final density = "Ñ@#W\$9876543210?!abc;:+=-,._ ";

  // ByteData bytes = ByteData(100*150);

  loadImage() async {
    var b = await rootBundle.load('image/cat-low-res.png');

    print("image byte size ${b.buffer.lengthInBytes / 4}");
  }

  printData(){
    // print(bytes.buffer.lengthInBytes);
  }


  @override
  Widget build(BuildContext context) {
    loadImage();
    printData();
    return Scaffold(
      body: Container(
        // height: 100,
        // width: 150,
        child: Image.asset("image/cat-low-res.png"),
      ),
    );
  }
}
