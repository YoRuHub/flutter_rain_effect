
import 'flutter_rain_effect_platform_interface.dart';

class FlutterRainEffect {
  Future<String?> getPlatformVersion() {
    return FlutterRainEffectPlatform.instance.getPlatformVersion();
  }
}
