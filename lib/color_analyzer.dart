import 'dart:io';

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorAnalyzer {
  static Future<Map<String, String>> analyze(File imageFile) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      FileImage(imageFile),
      maximumColorCount: 1,
    );
    final Color dominantColor = paletteGenerator.colors.isNotEmpty
        ? paletteGenerator.colors.first
        : Colors.black;
    final HSLColor hslColor = HSLColor.fromColor(dominantColor);
    final double complementaryHue = (hslColor.hue + 180) % 360;
    final Color complementaryColor = HSLColor.fromAHSL(
      hslColor.alpha,
      complementaryHue,
      hslColor.saturation,
      hslColor.lightness,
    ).toColor();
    final String dominantHex =
        '#${dominantColor.withAlpha(255).value.toRadixString(16).substring(2)}';
    final String complementaryHex =
        '#${complementaryColor.withAlpha(255).value.toRadixString(16).substring(2)}';
    return {'dominantHex': dominantHex, 'complementaryHex': complementaryHex};
  }
}
