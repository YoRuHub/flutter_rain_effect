import 'dart:math';
import '../models/splash_particle.dart'; // Importing the SplashParticle class

/// A class that manages the creation and updating of splash effects.
/// This class simulates water splashes by generating particles at specific positions.
class SplashEffect {
  /// A list of particles representing each individual splash effect.
  final List<SplashParticle> particles = [];

  /// A random number generator used to add variability to the particles' behavior.
  final Random random = Random();

  /// Creates a splash effect at a given position with a specified intensity.
  ///
  /// [x] and [y] specify the position where the splash should occur.
  /// [intensity] controls the magnitude of the splash, influencing particle size, speed, and quantity.
  /// [character] is an optional character that can represent the splash particles, otherwise, particles are drawn as circles.
  void createSplash(double x, double y, double intensity, String? character) {
    // The number of particles increases with intensity, making the splash more noticeable.
    final particleCount = (15 * intensity).round();

    for (int i = 0; i < particleCount; i++) {
      // A base angle to determine the direction of the particles' spread.
      final baseAngle = random.nextDouble() * 2 * pi;

      // Speed of the particles, influenced by intensity.
      final speed = 3.0 + random.nextDouble() * 4.0 * intensity;

      // Add a new particle to the particles list.
      particles.add(SplashParticle(
        x: x,
        y: y,
        // Horizontal spread with added randomness.
        dx: cos(baseAngle) * speed * (0.9 + random.nextDouble() * 0.5),
        // Vertical initial velocity, with some randomness to create more natural movement.
        dy: sin(baseAngle) * speed * (0.9 + random.nextDouble() * 0.5) - 3.0,
        // Randomized particle size, making larger particles for more intense splashes.
        size: 1.5 + random.nextDouble() * 2.5,
        // High initial opacity for particles, making them visible for a longer time.
        opacity: 0.9 + random.nextDouble() * 0.1,
        angle: random.nextDouble() * 2 * pi,
        // Increased rotation speed for more dynamic visual effects.
        angularVelocity: (random.nextDouble() - 0.5) * 0.3,
        character: character,
      ));
    }
  }

  /// Updates the state of all particles over time by applying physics effects.
  ///
  /// This method should be called regularly to keep the splash effect moving and fading.
  /// It also removes particles when their size or opacity becomes too low.
  void update() {
    for (int i = particles.length - 1; i >= 0; i--) {
      particles[i].update();

      // If a particle's opacity is too low or its size is too small, remove it from the list.
      if (particles[i].opacity < 0.05 || particles[i].size < 0.3) {
        particles.removeAt(i);
      }
    }
  }
}
