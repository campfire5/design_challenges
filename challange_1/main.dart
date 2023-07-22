import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final backgroundColor = const Color.fromARGB(255, 28, 40, 65);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.scale(
              scale: 3,
              child: SizedBox(
                width: 200,
                height: 100,
                child: Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.5),
                          color: const Color.fromARGB(255, 206, 232, 174)),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: CustomPaint(
                        size: const Size(150, 45),
                        painter: CustomShapePainter(color: backgroundColor),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  const CustomShapePainter({
    required this.color,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final arcDimension = size.height / 3;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(
        size.width,
        0,
      )
      ..lineTo(
        size.width,
        size.height,
      )
      ..quadraticBezierTo(size.width, size.height - arcDimension,
          size.width - arcDimension, size.height - arcDimension)
      ..lineTo(2 * arcDimension, size.height - arcDimension)
      ..quadraticBezierTo(arcDimension + 3, 30, arcDimension, arcDimension)
      ..quadraticBezierTo(arcDimension - 3, 0, 0, 0)
      ..lineTo(
        0,
        0,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TileHeadShapePainter extends CustomPainter {
  const TileHeadShapePainter({
    required this.color,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const arcDimension = 80.0;
    const tiltValue = 10;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(
        size.width - arcDimension,
        0,
      )
      ..quadraticBezierTo(
        size.width - arcDimension / 2 - tiltValue,
        0,
        size.width - arcDimension / 2,
        size.height / 2,
      )
      ..quadraticBezierTo(
        size.width - arcDimension / 2 + tiltValue,
        80,
        size.width,
        size.height,
      )
      ..lineTo(
        size.width,
        size.height,
      )
      ..lineTo(
        0,
        size.height,
      )
      ..quadraticBezierTo(
        0,
        0,
        arcDimension / 2,
        0,
      )
      ..lineTo(
        0,
        0,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
