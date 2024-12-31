import 'dart:ui';

class Splash {
  double x;
  double y;
  double dx;
  double dy;
  double size;
  double opacity;
  String? character;
  Color color;

  Splash({
    required this.x,
    required this.y,
    required this.dx,
    required this.dy,
    required this.size,
    required this.opacity,
    this.character,
    required this.color,
  });
}
