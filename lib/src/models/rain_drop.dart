import 'dart:ui';

/// Represents a raindrop in the rain effect.
///
/// This class contains the properties of a single raindrop, including its
/// position, speed, size, and color. It is used to simulate the falling of
/// raindrops in a rain animation.
class RainDrop {
  /// The horizontal position of the raindrop.
  ///
  /// This value determines where the raindrop starts horizontally on the screen.
  double x;

  /// The vertical position of the raindrop.
  ///
  /// This value determines where the raindrop starts vertically on the screen.
  double y;

  /// The falling speed of the raindrop.
  ///
  /// The speed at which the raindrop falls down the screen.
  double speed;

  /// The size of the raindrop.
  ///
  /// This value determines how large or small the raindrop appears on the screen.
  double size;

  /// The character used to represent the raindrop (optional).
  ///
  /// If provided, this character will be used to display the raindrop instead
  /// of the default circle representation.
  String? character;

  /// The color of the raindrop.
  ///
  /// This determines the color of the raindrop. It is typically set to blue
  /// or other colors depending on the effect.
  Color color;

  /// Creates a new [RainDrop] instance.
  ///
  /// The constructor initializes a raindrop with its position, speed, size,
  /// color, and optional character for rendering.
  RainDrop({
    required this.x,
    required this.y,
    required this.speed,
    required this.size,
    required this.color,
    this.character,
  });
}
