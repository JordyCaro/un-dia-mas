import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/painting.dart' show RadialGradient;
import 'package:un_dia_mas/core/theme/world_themes.dart';

/// Máscara de luz radial alrededor de la chispa — usada en niebla y prólogo.
class LightMaskOverlay extends PositionComponent {
  LightMaskOverlay({
    required this.theme,
    required this.lightPosition,
    this.extraRadius = 0,
  }) : super(priority: 100);

  final WorldTheme theme;
  Vector2 lightPosition;
  double extraRadius;

  @override
  void render(Canvas canvas) {
    if (theme.fogDensity <= 0) return;

    final gameSize = findGame()!.size;
    final radius = theme.lightRadius + extraRadius;

    final fogPaint = Paint()
      ..color = theme.atmosphereColor.withValues(alpha: theme.fogDensity)
      ..blendMode = BlendMode.srcOver;

    canvas.saveLayer(Rect.fromLTWH(0, 0, gameSize.x, gameSize.y), Paint());

    canvas.drawRect(
      Rect.fromLTWH(0, 0, gameSize.x, gameSize.y),
      fogPaint,
    );

    final holePaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0x00000000),
          const Color(0x00000000),
          theme.atmosphereColor.withValues(alpha: theme.fogDensity),
        ],
        stops: const [0.0, 0.55, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(lightPosition.x, lightPosition.y),
        radius: radius,
      ))
      ..blendMode = BlendMode.dstOut;

    canvas.drawCircle(
      Offset(lightPosition.x, lightPosition.y),
      radius,
      holePaint,
    );

    canvas.restore();
  }
}
