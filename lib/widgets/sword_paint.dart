import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart' as v;

class SwordLoading extends StatefulWidget {
  const SwordLoading({Key? key, this.loadColor = Colors.black, this.size = 88})
      : super(key: key);

  final Color loadColor;
  final double size;

  @override
  _SwordLoadingState createState() => _SwordLoadingState();
}

class _SwordLoadingState extends State<SwordLoading>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double angle = 0;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation = Tween(begin: 0.0, end: pi * 2).animate(_controller);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, _) => Transform(
            transform: Matrix4.identity()
              ..rotate(v.Vector3(0, -8, 12), pi)
              ..rotateZ(_animation.value),
            alignment: Alignment.center,
            child: CustomPaint(
              painter: MyPainter(widget.loadColor),
              size: Size(widget.size, widget.size),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, _) => Transform(
            transform: Matrix4.identity()
              ..rotate(v.Vector3(-12, 8, 8), pi)
              ..rotateZ(_animation.value),
            alignment: Alignment.center,
            child: CustomPaint(
              painter: MyPainter(widget.loadColor),
              size: Size(widget.size, widget.size),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, _) => Transform(
            transform: Matrix4.identity()
              ..rotate(v.Vector3(-8, -8, 6), pi)
              ..rotateZ(_animation.value),
            alignment: Alignment.center,
            child: CustomPaint(
              painter: MyPainter(widget.loadColor),
              size: Size(widget.size, widget.size),
            ),
          ),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  Color paintColor;

  MyPainter(this.paintColor);

  Paint _paint = Paint()
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeJoin = StrokeJoin.bevel
    ..strokeWidth = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    _paint..color = this.paintColor;
    Path path = new Path();
    // 获取视图的大小
    double w = size.width;
    double h = size.height;
    // 月牙上边界的高度
    double topH = h * 0.92;
    // 以区域中点开始绘制
    path.moveTo(0, h / 2);
    // 贝塞尔曲线连接path
    path.cubicTo(0, topH * 3 / 4, w / 4, topH, w / 2, topH);
    path.cubicTo((3 * w) / 4, topH, w, topH * 3 / 4, w, h / 2);
    path.cubicTo(w, h * 3 / 4, 3 * w / 4, h, w / 2, h);
    path.cubicTo(w / 4, h, 0, h * 3 / 4, 0, h / 2);

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      false; // 一次性画好，不需要更新，返回false
}
