import 'package:flutter/material.dart';

class ChallengeTwo extends StatelessWidget {
  const ChallengeTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 150,
        width: 300,
        child: CustomPaint(
          painter: RecipeShapePainter(),
        ),
      ),
    );
  }
}

class RecipeShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final curveHeight = 20.0;

    final paint = Paint()..color = Colors.red;

    final path = Path();

    path.moveTo(0, 0);

    //left curve
    path.lineTo(80, 0);
    path.quadraticBezierTo(90, 0, 100, curveHeight / 2);
    path.quadraticBezierTo(110, 20, 120, curveHeight);

    path.lineTo(width - 120, curveHeight);
    path.quadraticBezierTo(width - 110, 20, width - 100, curveHeight / 2);
    path.quadraticBezierTo(width - 90, 0, width - 80, 0);
    path.lineTo(width - 100, 0);

    // topRight -> bottomRight -> bottomLeft
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
