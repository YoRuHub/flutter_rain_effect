import 'dart:ui';

class RainDrop {
  double x;
  double y;
  double speed;
  double size;
  String? character;
  Color color;

  RainDrop({
    required this.x,
    required this.y,
    required this.speed,
    required this.size,
    required this.color,
    this.character,
  });
}
