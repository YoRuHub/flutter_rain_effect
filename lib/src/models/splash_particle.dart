/// Represents a splash particle in the splash effect.
///
/// This class defines the behavior of a splash particle, including its position,
/// velocity, size, rotation, and opacity. It is used to simulate a single particle
/// in the splash animation that occurs when a raindrop hits the ground.
class SplashParticle {
  /// The horizontal position of the splash particle.
  ///
  /// This value determines the x-coordinate of the splash particle on the screen.
  double x;

  /// The vertical position of the splash particle.
  ///
  /// This value determines the y-coordinate of the splash particle on the screen.
  double y;

  /// The horizontal velocity of the splash particle.
  ///
  /// This value controls how fast the particle moves horizontally.
  double dx;

  /// The vertical velocity of the splash particle.
  ///
  /// This value controls how fast the particle moves vertically.
  double dy;

  /// The size of the splash particle.
  ///
  /// This value determines how large or small the splash particle appears on the screen.
  double size;

  /// The opacity of the splash particle.
  ///
  /// This value determines how transparent the splash particle is, ranging from 0 (invisible) to 1 (fully opaque).
  double opacity;

  /// The angle of rotation of the splash particle.
  ///
  /// This value determines the current rotation angle of the particle in degrees.
  double angle;

  /// The angular velocity of the splash particle.
  ///
  /// This value controls how quickly the splash particle rotates.
  double angularVelocity;

  /// The character used to represent the splash particle (optional).
  ///
  /// If provided, this character will be used to display the particle instead
  /// of the default representation.
  String? character;

  /// Creates a new [SplashParticle] instance.
  ///
  /// The constructor initializes a splash particle with its position, velocity,
  /// size, opacity, rotation angle, and angular velocity. An optional character
  /// for rendering the splash particle can also be provided.
  SplashParticle({
    required this.x,
    required this.y,
    required this.dx,
    required this.dy,
    required this.size,
    required this.opacity,
    required this.angle,
    required this.angularVelocity,
    this.character,
  });

  /// Updates the state of the splash particle.
  ///
  /// This method applies gravity, air resistance, and updates the position, rotation,
  /// size, and opacity of the particle to simulate its movement and fading over time.
  void update() {
    // Apply gravity to the vertical velocity
    dy += 0.3;

    // Apply air resistance to both horizontal and vertical velocities
    dx *= 0.98;
    dy *= 0.98;

    // Update the particle's position based on its velocities
    x += dx;
    y += dy;

    // Update the rotation angle and angular velocity
    angle += angularVelocity;
    angularVelocity *= 0.98;

    // Gradually decrease the size and opacity to simulate fading
    size *= 0.99;
    opacity *= 0.97;
  }
}
