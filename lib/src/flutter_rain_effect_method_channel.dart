import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_rain_effect_platform_interface.dart';

/// An implementation of [FlutterRainEffectPlatform] that uses method channels.
class MethodChannelFlutterRainEffect extends FlutterRainEffectPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_rain_effect');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
