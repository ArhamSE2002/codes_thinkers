import 'package:flutter/material.dart';
import 'dart:math';

class FullCircleLoading extends StatefulWidget {
  const FullCircleLoading({super.key});

  @override
  _FullCircleLoadingState createState() => _FullCircleLoadingState();
}

class _FullCircleLoadingState extends State<FullCircleLoading>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    _animation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: FullCirclePainter(_animation.value),
          child: const SizedBox(
            width: 50,
            height: 50,
          ),
        );
      },
    );
  }
}

class FullCirclePainter extends CustomPainter {
  final double _angle;

  FullCirclePainter(this._angle);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFFFDD51D)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      0,
      _angle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
