import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rain_effect/flutter_rain_effect.dart';
import 'package:flutter_rain_effect/src/models/splash.dart';

/// A widget that simulates a rain effect with raindrops and splashes.
///
/// This widget displays a customizable rain animation with different rain
/// intensity, character representation for raindrops, splash effects when
/// raindrops hit the ground, and customizable colors and sizes.
class RainEffect extends StatefulWidget {
  /// The intensity of the rain effect, ranging from 0.0 (no rain) to 1.0 (full rain).
  final double intensity;

  /// A list of characters used to represent raindrops. If null, default representation is used.
  final List<String>? rainCharacter;

  /// A list of colors for raindrops. If null, the default color is blue.
  final List<Color>? rainColors;

  /// The minimum size of a raindrop.
  final double? minRainSize;

  /// The maximum size of a raindrop.
  final double? maxRainSize;

  const RainEffect({
    super.key,
    this.intensity = 1.0,
    this.rainCharacter,
    this.rainColors = const [Colors.blue],
    this.minRainSize = 2.0,
    this.maxRainSize = 5.0,
  });

  @override
  State<RainEffect> createState() => _RainEffectState();
}

class _RainEffectState extends State<RainEffect> {
  /// The list of currently falling raindrops.
  final List<RainDrop> rainDrops = [];

  /// The list of currently active splash particles.
  final List<Splash> splashes = [];

  /// Random number generator used for randomization in rain and splash effects.
  final Random random = Random();

  /// Timer used to periodically update the rain effect.
  late Timer _timer;

  /// The height of the container holding the rain effect.
  double containerHeight = 0;

  /// The width of the container holding the rain effect.
  double containerWidth = 0;

  @override
  void initState() {
    super.initState();
    // Periodically update the rain and splash effect every 16 milliseconds.
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

  /// Updates the state of the rain and splash effect.
  ///
  /// This method generates new raindrops based on the current intensity, updates
  /// the position of existing raindrops, and generates splash particles when raindrops
  /// hit the bottom of the container.
  void _updateRain() {
    if (random.nextDouble() < widget.intensity * 0.1) {
      String? character;
      if (widget.rainCharacter != null && widget.rainCharacter!.isNotEmpty) {
        // Randomly select a character from the rainCharacter list if available.
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

    // Update existing raindrops and create splashes if necessary.
    for (int i = rainDrops.length - 1; i >= 0; i--) {
      final drop = rainDrops[i];
      drop.y += drop.speed;

      // When a raindrop reaches the bottom of the container, create a splash.
      if (drop.y > containerHeight) {
        _createSplash(drop);
        rainDrops.removeAt(i);
      }
    }

    // Update existing splash particles.
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

      // Remove splash particles that have faded out.
      if (splash.opacity <= 0) {
        splashes.removeAt(i);
      }
    }
  }

  /// Creates splash particles when a raindrop hits the ground.
  ///
  /// This method generates a random number of splash particles based on the speed
  /// of the raindrop, and adds them to the splash list for rendering.
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
