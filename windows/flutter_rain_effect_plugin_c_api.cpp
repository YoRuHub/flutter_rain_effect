#include "include/flutter_rain_effect/flutter_rain_effect_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_rain_effect_plugin.h"

void FlutterRainEffectPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_rain_effect::FlutterRainEffectPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
