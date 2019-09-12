import 'package:flutter/material.dart';
import 'dart:math' as math;

class SoundWave extends StatefulWidget {

  final AnimationController controller;
  final double startSize;
  final double endSize;

  SoundWave(
      this.controller,
      this.startSize,
      this.endSize,
      );

  @override
  State<StatefulWidget> createState() {
    return _SoundWaveState();
  }

}

class _SoundWaveState extends State<SoundWave> {

  Animation<double> _animation;

  Paint wavePaint;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    wavePaint = Paint()
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
    _animation = Tween(begin: widget.startSize/2 + 2, end: widget.startSize/2 + 5)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate))
      ..addListener(() {
        if (mounted) {
          setState(() {

          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(widget.endSize, widget.endSize),
      painter: _CircleWavePainter(!controller.isAnimating? -1: _animation.value, wavePaint, widget.startSize),
    );
  }

  @override
  void dispose() {
//    controller.dispose();// 可能复用，在effect dispose去释放
    super.dispose();
  }

}

class _CircleWavePainter extends CustomPainter {

  final double waveRadius;
  final double startSize;

  final Paint wavePaint;

  _CircleWavePainter(
      this.waveRadius, 
      this.wavePaint,
      this.startSize);

  @override
  void paint(Canvas canvas, Size size) {
    if (waveRadius == -1) {
      return;
    }
    double centerX = size.width / 2.0;
    double centerY = size.height / 2.0;
    double maxRadius = math.min(centerY, centerX);
    wavePaint.strokeWidth = 2;
    wavePaint.color = const Color(0xFF2A6ED9);
    canvas.drawCircle(Offset(centerX, centerY), startSize/2, wavePaint);

    wavePaint.strokeWidth = 1;
    double currentRadius = waveRadius;
    int alpha = (230 - ((waveRadius - startSize/2 - 2)*50)).toInt();
    while(currentRadius < maxRadius) {
      wavePaint.color = (const Color(0xFF2A6ED9)).withAlpha(alpha);
      canvas.drawCircle(Offset(centerX, centerY), currentRadius, wavePaint);
      currentRadius += 3;
      alpha -= 70;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}