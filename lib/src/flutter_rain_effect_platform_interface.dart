import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_rain_effect_method_channel.dart';

abstract class FlutterRainEffectPlatform extends PlatformInterface {
  /// Constructs a FlutterRainEffectPlatform.
  FlutterRainEffectPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterRainEffectPlatform _instance = MethodChannelFlutterRainEffect();

  /// The default instance of [FlutterRainEffectPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterRainEffect].
  static FlutterRainEffectPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterRainEffectPlatform] when
  /// they register themselves.
  static set instance(FlutterRainEffectPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
