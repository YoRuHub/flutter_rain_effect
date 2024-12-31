# Flutter Rain Effect

A highly customizable rain effect package for Flutter applications, featuring realistic water splash effects and flexible customization options.

## Features

- Highly customizable rain drop appearance (colors, sizes, characters, speed)
- Realistic splash effects upon rain drops hitting the ground
- Configurable rain intensity for dynamic visual effects
- Support for multiple rain drop colors
- Optimized for performance with smooth animations

## Getting Started

Add this package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_rain_effect: ^0.0.1
```

Then, run `flutter pub get` to install the package.

## Usage

### Basic Usage

Create a simple rain effect:

```dart
import 'package:flutter_rain_effect/flutter_rain_effect.dart';

RainEffect(
  intensity: 1.0, // Rain intensity (0.0 to 1.0)
);
```

### Advanced Usage

Customize the rain effect with characters, splash effects, and more:

```dart
import 'package:flutter_rain_effect/flutter_rain_effect.dart';

RainEffect(
  intensity: 0.8, // Set rain intensity
  rainCharacter: ['|', '/', '\\'], // Use characters for rain drops
  splashCharacter: '*', // Use a character for splash effects
  rainColors: [Colors.blue, Colors.cyan], // Define rain drop colors
  minRainSize: 2.0, // Minimum size of rain drops
  maxRainSize: 6.0, // Maximum size of rain drops
);
```

### Layout Constraints

Ensure the RainEffect widget is wrapped in a widget that defines its size, like a `SizedBox` or `LayoutBuilder`, to ensure it renders correctly.

```dart
SizedBox(
  width: 300,
  height: 500,
  child: RainEffect(
    intensity: 1.0,
    rainColors: [Colors.lightBlue, Colors.blueAccent],
  ),
);
```

## Configuration Options

| Property          | Description                                                | Default             |
|-------------------|------------------------------------------------------------|---------------------|
| `intensity`       | Adjusts the density of the rain effect (0.0 to 1.0).        | `1.0`               |
| `rainCharacter`   | List of characters to use for rain drops.                   | `null` (circular drops) |
| `splashCharacter` | Character to use for splash effects.                        | `null`              |
| `rainColors`      | List of colors for rain drops.                              | `[Colors.blue]`     |
| `minRainSize`     | Minimum size of rain drops.                                 | `2.0`               |
| `maxRainSize`     | Maximum size of rain drops.                                 | `5.0`               |

## Example

Here’s a complete example:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_rain_effect/flutter_rain_effect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rain Effect Example'),
        ),
        body: Center(
          child: RainEffect(
            intensity: 0.5,
            rainCharacter: ['|', '/', '\\'],
            splashCharacter: '*',
            rainColors: [Colors.lightBlue, Colors.blue],
            minRainSize: 3.0,
            maxRainSize: 8.0,
          ),
        ),
      ),
    );
  }
}
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request or file an issue to suggest improvements or report bugs.

## License

This package is available under the MIT license. See the LICENSE file for more details.
