import 'dart:math' show atan2, Random;
import 'package:flutter/material.dart';
import '../models/rain_drop.dart';
import '../models/splash.dart';

class RainPainter extends CustomPainter {
  final List<RainDrop> rainDrops;
  final List<Splash> splashes;

  final Random random = Random();

  RainPainter({
    required this.rainDrops,
    required this.splashes,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    for (final drop in rainDrops) {
      paint.color = drop.color.withAlpha(
        (255 * (0.6 + (drop.y / size.height) * 0.4)).toInt(),
      );

      final length = drop.size * 3 + random.nextDouble() * 5;
      final width = drop.size / 5;

      if (drop.character != null && drop.character!.isNotEmpty) {
        textPainter.text = TextSpan(
          text: drop.character,
          style: TextStyle(
            color: paint.color,
            fontSize: drop.size * 4,
          ),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(
              drop.x - textPainter.width / 2, drop.y - textPainter.height / 2),
        );
      } else {
        canvas.save();
        canvas.translate(drop.x, drop.y);

        final rect = Rect.fromLTWH(
          -width / 2,
          -length / 2,
          width,
          length,
        );

        canvas.drawRect(rect, paint);
        canvas.restore();
      }
    }

    for (final splash in splashes) {
      if (splash.opacity <= 0) {
        continue;
      }

      if (splash.x <= 0 || splash.x >= size.width) {
        splash.dx = -splash.dx;
        splash.x = splash.x.clamp(0, size.width);
      }
      if (splash.y <= 0 || splash.y >= size.height) {
        splash.dy = -splash.dy;
        splash.y = splash.y.clamp(0, size.height);
      }

      paint.color = splash.color.withAlpha(
        (255 * splash.opacity).toInt(),
      );

      if (splash.character != null && splash.character!.isNotEmpty) {
        textPainter.text = TextSpan(
          text: splash.character,
          style: TextStyle(
            color: paint.color,
            fontSize: splash.size * 4,
          ),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(splash.x - textPainter.width / 2,
              splash.y - textPainter.height / 2),
        );
      } else {
        final rect = Rect.fromLTWH(
          splash.x - splash.size,
          splash.y - splash.size * 0.5,
          splash.size / 2,
          splash.size / 2,
        );

        canvas.save();
        canvas.translate(splash.x, splash.y);

        canvas.rotate(atan2(splash.dy, splash.dx));
        canvas.translate(-splash.x, -splash.y);

        canvas.drawOval(rect, paint);
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(RainPainter oldDelegate) => true;
}
