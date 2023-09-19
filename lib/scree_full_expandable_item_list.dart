import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:supercharged/supercharged.dart';

class ScreenFull extends StatefulWidget {
  const ScreenFull({Key? key}) : super(key: key);

  @override
  State<ScreenFull> createState() => _ScreenFullState();
}

class _ScreenFullState extends State<ScreenFull> {
  //
  List<bool> opened = [false, false, false, false, false];
  List<Color> colors = List.generate(
    5,
    // (index) => backgroundColor,
    (index) => index % 2 == 0 ? Color(0xff051A16) : Color(0xFF04211C),
  );

  bool allClosed = true;

  setOneOpened(int index) {
    setState(() {
      allClosed = false;
      for (int i = 0; i < opened.length; i++) {
        if (i == index) {
          opened[i] = true;
        } else {
          opened[i] = false;
        }
      }
    });
  }

  setAllClosed() {
    setState(() {
      allClosed = true;
      for (int i = 0; i < opened.length; i++) {
        opened[i] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    const menuItems = 5;
    const openItemFactor = 20;
    const imagenaryItemsWhenOpen = (menuItems - 1 + openItemFactor);

    final initialHeight = height / menuItems;
    final openedHeight = height / imagenaryItemsWhenOpen * openItemFactor;
    final closedHeight = height / imagenaryItemsWhenOpen;

    double getHeight(int index) {
      if (allClosed) {
        return initialHeight;
      } else {
        if (opened[index]) {
          return openedHeight;
        } else {
          return closedHeight;
        }
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
          children: List.generate(menuItems, (index) {
        return item(
          items[index],
          opened[index],
          getHeight(index),
          colors[index],
          () {
            setState(() {
              if (opened[index]) {
                setAllClosed();
              } else {
                setOneOpened(index);
              }
            });
          },
        );
      })),
    );
  }

  Widget item(String title, bool expanded, double height, Color color, VoidCallback onTap) {
    return AnimatedContainer(
      duration: 200.milliseconds,
      height: height,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: color,
          child: expanded
              ? SingleChildScrollView(
                child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: accentColor,
                          fontSize: 100,
                        ),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          color: accentColor,
                          fontSize: 100,
                        ),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          color: accentColor,
                          fontSize: 100,
                        ),
                      ),
                    ],
                  ),
              )
              : Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: accentColor,
                      fontSize: 100,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  final items = ['Home', 'About', 'Service', 'Protfolio', 'Contact'];
}
