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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPaint(
                      size: Size(width * 0.4, 40),
                      painter: TileHeadShapePainter(color: backgroundColor),
                    ),
                    CustomPaint(
                      size: Size(width, 100),
                      painter: TileBodyShapePainter(color: backgroundColor),
                    ),
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

class TileBodyShapePainter extends CustomPainter {
  const TileBodyShapePainter({
    required this.color,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const radius = 20.0;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, size.width, size.height),
        topRight: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ),
      paint,
    );
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

    const arcDimension = 40.0;
    const tiltValue = 8.0;

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
        arcDimension,
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
