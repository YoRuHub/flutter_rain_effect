import 'package:flutter/material.dart';

/// A controller that manages the state of a rain effect.
///
/// This class allows you to start or stop the rain, and adjust its intensity.
/// It uses the ChangeNotifier mechanism to notify listeners about changes
/// to the rain state and intensity.
class RainEffectController extends ChangeNotifier {
  /// A flag indicating whether it is raining.
  bool _isRaining = true;

  /// The intensity of the rain, ranging from 0.0 (no rain) to 1.0 (maximum intensity).
  double _intensity = 1.0;

  /// Returns whether it is currently raining.
  bool get isRaining => _isRaining;

  /// Returns the current intensity of the rain.
  double get intensity => _intensity;

  /// Starts the rain.
  ///
  /// Sets the _isRaining flag to true and notifies listeners to update
  /// any UI or behavior dependent on the rain state.
  void startRain() {
    _isRaining = true;
    notifyListeners();
  }

  /// Stops the rain.
  ///
  /// Sets the _isRaining flag to false and notifies listeners to update
  /// any UI or behavior dependent on the rain state.
  void stopRain() {
    _isRaining = false;
    notifyListeners();
  }

  /// Sets the intensity of the rain.
  ///
  /// [intensity] is clamped to be between 0.0 (no rain) and 1.0 (maximum intensity).
  /// After setting the intensity, listeners are notified to update any UI or behavior
  /// dependent on the intensity value.
  void setIntensity(double intensity) {
    _intensity = intensity.clamp(0.0, 1.0);
    notifyListeners();
  }

  /// Disposes of the controller.
  ///
  /// This method is called when the controller is no longer needed. It ensures
  /// that the rain state is stopped, and then the super class dispose method is called.
  @override
  void dispose() {
    _isRaining = false;
    super.dispose();
  }
}
