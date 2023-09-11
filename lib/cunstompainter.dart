import 'package:flutter/material.dart';

class DrawArcPractice extends StatefulWidget {
  const DrawArcPractice({super.key});

  @override
  State<DrawArcPractice> createState() => _DrawArcPracticeState();
}

class _DrawArcPracticeState extends State<DrawArcPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Apple Watch"),
      ),
      body: Center(
        child: CustomPaint(
          // 커스텀 페인터를 렌더링하고 크기를 정한다.
          // 그림 그릴 캔버스 영역을 만드는 것.
          painter: DrawArcPracticePainter(),
          size: Size(400, 400),
        ),
      ),
    );
  }
}

class DrawArcPracticePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    //true 또는 false를 반환해야 하는 메서드
    return false;
  }
}
