class SplashParticle {
  double x;
  double y;
  double dx;
  double dy;
  double size;
  double opacity;
  double angle;
  double angularVelocity;
  String? character;

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

  // パーティクルの状態を更新
  void update() {
    // 重力の影響
    dy += 0.3;

    // 空気抵抗による減速
    dx *= 0.98;
    dy *= 0.98;

    // 位置の更新
    x += dx;
    y += dy;

    // 回転の更新
    angle += angularVelocity;
    angularVelocity *= 0.98;

    // サイズと透明度の更新
    size *= 0.99;
    opacity *= 0.97;
  }
}
