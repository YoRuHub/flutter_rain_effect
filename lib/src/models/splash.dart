import 'dart:ui';

/// Represents a splash effect particle.
///
/// This class defines a splash particle used in the rain effect simulation. It
/// includes properties for position, velocity, size, opacity, and color, as well as
/// an optional character to represent the splash particle.
class Splash {
  /// The horizontal position of the splash particle.
  ///
  /// This value determines the x-coordinate of the splash on the screen.
  double x;

  /// The vertical position of the splash particle.
  ///
  /// This value determines the y-coordinate of the splash on the screen.
  double y;

  /// The horizontal velocity of the splash particle.
  ///
  /// This value controls the horizontal speed at which the splash moves.
  double dx;

  /// The vertical velocity of the splash particle.
  ///
  /// This value controls the vertical speed at which the splash moves.
  double dy;

  /// The size of the splash particle.
  ///
  /// This value determines how large or small the splash appears on the screen.
  double size;

  /// The opacity of the splash particle.
  ///
  /// This value determines the transparency of the splash particle, with 1.0 being fully opaque
  /// and 0.0 being completely transparent.
  double opacity;

  /// The character used to represent the splash particle (optional).
  ///
  /// If provided, this character will be used to represent the splash particle instead
  /// of a default visual representation.
  String? character;

  /// The color of the splash particle.
  ///
  /// This value determines the color used to render the splash on the screen.
  Color color;

  /// Creates a new [Splash] particle.
  ///
  /// The constructor initializes a splash particle with its position, velocity,
  /// size, opacity, color, and an optional character for visual representation.
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
