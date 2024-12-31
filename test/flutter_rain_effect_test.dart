import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_rain_effect/src/flutter_rain_effect.dart';
import 'package:flutter_rain_effect/src/flutter_rain_effect_platform_interface.dart';
import 'package:flutter_rain_effect/src/flutter_rain_effect_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterRainEffectPlatform
    with MockPlatformInterfaceMixin
    implements FlutterRainEffectPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterRainEffectPlatform initialPlatform =
      FlutterRainEffectPlatform.instance;

  test('$MethodChannelFlutterRainEffect is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterRainEffect>());
  });

  test('getPlatformVersion', () async {
    FlutterRainEffect flutterRainEffectPlugin = FlutterRainEffect();
    MockFlutterRainEffectPlatform fakePlatform =
        MockFlutterRainEffectPlatform();
    FlutterRainEffectPlatform.instance = fakePlatform;

    expect(await flutterRainEffectPlugin.getPlatformVersion(), '42');
  });
}
