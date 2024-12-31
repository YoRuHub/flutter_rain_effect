import 'dart:math';
import '../models/splash_particle.dart'; // SplashParticle クラスをインポート

class SplashEffect {
  final List<SplashParticle> particles = [];
  final Random random = Random();

  void createSplash(double x, double y, double intensity, String? character) {
    // パーティクル数を増やして、より顕著な水しぶきに
    final particleCount = (15 * intensity).round();

    for (int i = 0; i < particleCount; i++) {
      final baseAngle = random.nextDouble() * 2 * pi;
      // スピードを増加させて、より顕著な動きに
      final speed = 3.0 + random.nextDouble() * 4.0 * intensity;

      particles.add(SplashParticle(
        x: x,
        y: y,
        // 横方向の広がりを強調
        dx: cos(baseAngle) * speed * (0.9 + random.nextDouble() * 0.5),
        // 上方向の初速を増加
        dy: sin(baseAngle) * speed * (0.9 + random.nextDouble() * 0.5) - 3.0,
        // パーティクルサイズを大きく
        size: 1.5 + random.nextDouble() * 2.5,
        // 初期透明度を上げる
        opacity: 0.9 + random.nextDouble() * 0.1,
        angle: random.nextDouble() * 2 * pi,
        // 回転速度を増加
        angularVelocity: (random.nextDouble() - 0.5) * 0.3,
        character: character,
      ));
    }
  }

  void update() {
    for (int i = particles.length - 1; i >= 0; i--) {
      particles[i].update();

      // 透明度のしきい値を下げて、パーティクルの寿命を延長
      if (particles[i].opacity < 0.05 || particles[i].size < 0.3) {
        particles.removeAt(i);
      }
    }
  }
}
