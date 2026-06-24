import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:un_dia_mas/core/theme/app_colors.dart';

/// Círculo de meditación bajo la chispa en P2.
class MeditationCircleComponent extends PositionComponent {
  MeditationCircleComponent({required this.centerPos, this.radius = 80});

  final Vector2 centerPos;
  final double radius;
  double _phase = 0;
  double calmFactor = 0;

  @override
  void update(double dt) {
    super.update(dt);
    _phase += dt;
  }

  @override
  void render(Canvas canvas) {
    final pulse = 1 + math.sin(_phase * 1.5) * 0.04 * (1 - calmFactor);
    final r = radius * pulse;

    canvas.drawCircle(
      Offset(centerPos.x, centerPos.y),
      r,
      Paint()
        ..color = ChispaColors.halo.withValues(alpha: 0.06 + calmFactor * 0.08)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    canvas.drawCircle(
      Offset(centerPos.x, centerPos.y),
      r * 0.65,
      Paint()
        ..color = ChispaColors.corona.withValues(alpha: 0.04 + calmFactor * 0.06)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }
}
