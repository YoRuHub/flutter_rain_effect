import 'package:flutter/material.dart';

class RainEffectController extends ChangeNotifier {
  bool _isRaining = true;
  double _intensity = 1.0;

  bool get isRaining => _isRaining;
  double get intensity => _intensity;

  void startRain() {
    _isRaining = true;
    notifyListeners();
  }

  void stopRain() {
    _isRaining = false;
    notifyListeners();
  }

  void setIntensity(double intensity) {
    _intensity = intensity.clamp(0.0, 1.0);
    notifyListeners();
  }

  @override
  void dispose() {
    _isRaining = false;
    super.dispose();
  }
}
