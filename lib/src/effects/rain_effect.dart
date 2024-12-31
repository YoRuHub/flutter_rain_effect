import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rain_effect/flutter_rain_effect.dart';
import 'package:flutter_rain_effect/src/models/splash.dart';

class RainEffect extends StatefulWidget {
  final double intensity;
  final List<String>? rainCharacter;
  final String? splashCharacter;
  final List<Color>? rainColors;
  final double? minRainSize;
  final double? maxRainSize;

  const RainEffect({
    super.key,
    this.intensity = 1.0,
    this.rainCharacter,
    this.splashCharacter,
    this.rainColors = const [Colors.blue],
    this.minRainSize = 2.0,
    this.maxRainSize = 5.0,
  });

  @override
  State<RainEffect> createState() => _RainEffectState();
}

class _RainEffectState extends State<RainEffect> {
  final List<RainDrop> rainDrops = [];
  final List<Splash> splashes = [];
  final Random random = Random();
  late Timer _timer;

  double containerHeight = 0;
  double containerWidth = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        _updateRain();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateRain() {
    if (random.nextDouble() < widget.intensity * 0.1) {
      String? character;
      if (widget.rainCharacter != null && widget.rainCharacter!.isNotEmpty) {
        character =
            widget.rainCharacter![random.nextInt(widget.rainCharacter!.length)];
      }

      final rainSize = widget.minRainSize! +
          random.nextDouble() * (widget.maxRainSize! - widget.minRainSize!);

      Color rainColor =
          widget.rainColors![random.nextInt(widget.rainColors!.length)];
      rainDrops.add(RainDrop(
        x: random.nextDouble() * containerWidth,
        y: -10,
        speed: 5 + random.nextDouble() * 7,
        size: rainSize,
        color: rainColor,
        character: character,
      ));
    }

    for (int i = rainDrops.length - 1; i >= 0; i--) {
      final drop = rainDrops[i];
      drop.y += drop.speed;

      if (drop.y > containerHeight) {
        _createSplash(drop);
        rainDrops.removeAt(i);
      }
    }

    for (int i = splashes.length - 1; i >= 0; i--) {
      final splash = splashes[i];

      if (splash.dy < 0) {
        splash.dy += 0.1;
      } else {
        splash.dy += 0.2;
      }

      splash.x += splash.dx;
      splash.y += splash.dy;

      splash.dx *= 0.98;
      splash.size *= 0.995;
      splash.opacity -= 0.015;

      if (splash.opacity <= 0) {
        splashes.removeAt(i);
      }
    }
  }

  void _createSplash(RainDrop drop) {
    final splashCount = 5 + (drop.speed ~/ 2);

    for (int j = 0; j < splashCount; j++) {
      final angle = (pi / 4) + (random.nextDouble() * pi / 2);
      final speed = 2 + random.nextDouble() * 3;

      splashes.add(Splash(
        x: drop.x,
        y: containerHeight,
        dx: cos(angle) * speed * (0.5 + random.nextDouble()),
        dy: -sin(angle) * speed * (0.8 + random.nextDouble() * 0.4),
        size: drop.size * (0.8 + random.nextDouble() * 0.4),
        opacity: 0.8 + random.nextDouble() * 0.2,
        character: drop.character,
        color: drop.color,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        containerHeight = constraints.maxHeight;
        containerWidth = constraints.maxWidth;

        return SizedBox(
          width: containerWidth,
          height: containerHeight,
          child: CustomPaint(
            painter: RainPainter(
              rainDrops: rainDrops,
              splashes: splashes,
            ),
            size: Size(containerWidth, containerHeight),
          ),
        );
      },
    );
  }
}
