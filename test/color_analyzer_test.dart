import 'dart:io';

import 'package:architect_app/color_analyzer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group(
    'ColorAnalyzer',
    () {
      test(
        'Return Dominant and Complementary Colors',
        () async {
          final logger = Logger();

          final testImagePath = path.join(
              Directory.current.path, 'test', 'assets', 'test_image.jpg');
          final testImageFile = File(testImagePath);

          final result = await ColorAnalyzer.analyze(testImageFile);

          expect(result, isMap);
          expect(result.containsKey('dominantHex'), true);
          expect(result.containsKey('complementaryHex'), true);
          expect(result['dominantHex'], isNotNull);
          expect(result['complementaryHex'], isNotNull);
          expect(result['dominantHex'], isA<String>());
          expect(result['complementaryHex'], isA<String>());

          logger.i('Dominant Color: ${result['dominantHex']}');
          logger.i('Complementary Color: ${result['complementaryHex']}');
        },
      );
    },
  );
}
