import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class ExperimentWidget extends StatefulWidget {
  const ExperimentWidget({super.key});

  @override
  State<ExperimentWidget> createState() => _ExperimentWidgetState();
}

class _ExperimentWidgetState extends State<ExperimentWidget> {
  late final Size canvasSize = const Size(400, 400);
  late final int pixSize = 10;
  late int cols = canvasSize.width ~/ pixSize;
  late int rows = canvasSize.height ~/ pixSize;
  late List<List<int>> grid = make2DArray(cols, rows);

  Offset mousePosition = const Offset(0, 0);
  List<Offset> mouseClickedGridOffset = [];

  @override
  void initState() {
    super.initState();

    Timer.periodic(50.milliseconds, (timer) {
      setState(() {
        final nextGrid = make2DArray(cols, rows);
        for (int x = 0; x < cols; x++) {
          for (int y = 0; y < rows; y++) {
            // gravity
            if (grid[x][y] == 1 && y < rows - 1) {
              nextGrid[x][y + 1] = 1;
            }
            // bottom row
            if (grid[x][y] == 1 && y == rows - 1) {
              nextGrid[x][y] = 1;
            }

            final isGoLeft = Random().nextBool();
            int dir;

            if (isGoLeft) {
              dir = -1;
            } else {
              dir = 1;
            }

            // below has a sand
            if (grid[x][y] == 1 && y < rows - 1 && grid[x][y + 1] == 1) {
              //
              /* below right is empty */
              if (x + 1 * dir < cols && x + 1 * dir > 0 && grid[x + 1 * dir][y + 1] == 0) {
                nextGrid[x + 1 * dir][y + 1] = 1;
                //+
                /* below left is empty */
              } else if (x - 1 * dir < cols && x - 1 * dir > 0 && grid[x - 1 * dir][y + 1] == 0) {
                nextGrid[x - 1 * dir][y + 1] = 1;
                //
              } else {
                nextGrid[x][y] = 1;
              }
            }

            final offset = Offset(x.toDouble(), y.toDouble());
            final clickedOnPosition = mouseClickedGridOffset.contains(offset);

            if (clickedOnPosition) {
              nextGrid[x][y] = 1;
              mouseClickedGridOffset.remove(offset);
            }
          }
        }
        grid = nextGrid;
      });
    });
  }

  Timer? adder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            // final gridOffset = Offset(
            //   (mousePosition.dx ~/ pixSize).toDouble(),
            //   (mousePosition.dy ~/ pixSize).toDouble(),
            // );
            // mouseClickedGridOffset.add(gridOffset);
          },
          onLongPressDown: (details) {
            adder?.cancel();
            adder = Timer.periodic(50.milliseconds, (timer) {
              setState(() {
                final gridOffset = Offset(
                  (mousePosition.dx ~/ pixSize).toDouble(),
                  (mousePosition.dy ~/ pixSize).toDouble(),
                );
                mouseClickedGridOffset.add(gridOffset);
              });
            });
          },
          onLongPressEnd: (details) {
            adder?.cancel();
          },
          child: MouseRegion(
            onHover: (val) {
              mousePosition = val.localPosition;
            },
            child: CustomPaint(
              painter: FallingSand(
                cols: cols,
                rows: rows,
                grid: grid,
                pixSize: pixSize,
              ),
              size: canvasSize,
            ),
          ),
        ),
      ),
    );
  }

  static List<List<int>> make2DArray(int cols, int rows) {
    final arr = List.generate(cols, (_) => List.filled(rows, 0));
    return arr;
  }
}

class FallingSand extends CustomPainter {
  final int rows;
  final int cols;
  final int pixSize;
  final List<List<int>> grid;

  FallingSand({required this.rows, required this.cols, required this.pixSize, required this.grid});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        canvas.drawRect(
          Rect.fromLTWH(
            i * pixSize.toDouble(),
            j * pixSize.toDouble(),
            pixSize.toDouble(),
            pixSize.toDouble(),
          ),
          Paint()
            ..color = grid[i][j] == 0 ? Colors.black : Colors.white
            ..style = PaintingStyle.fill,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
