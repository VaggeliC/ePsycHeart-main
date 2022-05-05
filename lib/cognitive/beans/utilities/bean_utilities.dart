import 'dart:math';
import 'dart:ui';

import 'package:epsycheart/core/utilities/app_theme.dart';

Color beansGenerateTargetColor() =>
    AppTheme.colors[Random().nextInt(AppTheme.colors.length)];

List<Color> beansGenerateRandomColors(
    {required Color targetColor, int count = 4}) {
  List<Color> colorList =
      AppTheme.colors.where((color) => color != targetColor).toList();

  List<Color> colors = [];
  for (int i = 0; i < count - 1; i++) {
    final colorIndex = Random().nextInt(colorList.length);

    Color color = colorList[colorIndex];
    colorList.removeAt(colorIndex);

    colors.add(color);
  }

  // insert target color in random position
  colors.insert(Random().nextInt(colors.length), targetColor);

  return colors;
}
