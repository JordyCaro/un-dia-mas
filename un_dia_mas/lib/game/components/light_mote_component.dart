import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/painting.dart' show RadialGradient;
import 'package:un_dia_mas/core/theme/app_colors.dart';

/// Mota de luz — objetivo con rayos tipo faro.
class LightMoteComponent extends PositionComponent {
  LightMoteComponent({
    required Vector2 position,
    this.radius = 36,
    this.pulseSpeed = 1.2,
    this.isGoal = true,
    this.label,
  }) : super(
          position: position,
          size: Vector2.all(radius * 5),
          anchor: Anchor.center,
        );

  final double radius;
  final double pulseSpeed;
  final bool isGoal;
  final String? label;

  double _phase = 0;
  bool reached = false;

  @override
  void update(double dt) {
    super.update(dt);
    if (!reached) _phase += dt * pulseSpeed;
  }

  @override
  void render(Canvas canvas) {
    if (reached) return;

    final center = size / 2;
    final pulse = 0.85 + 0.15 * (1 + math.sin(_phase)) / 2;
    final r = radius * pulse;
    final offset = Offset(center.x, center.y);

    if (isGoal) {
      for (var i = 0; i < 4; i++) {
        final rayAngle = (i / 4) * math.pi * 2 + _phase * 0.5;
        final rayPath = Path()
          ..moveTo(offset.dx, offset.dy)
          ..lineTo(
            offset.dx + math.cos(rayAngle) * r * 2.8,
            offset.dy + math.sin(rayAngle) * r * 2.8,
          );
        canvas.drawPath(
          rayPath,
          Paint()
            ..color = ChispaColors.halo.withValues(alpha: 0.08 + math.sin(_phase) * 0.04)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
        );
      }
    }

    canvas.drawCircle(
      offset,
      r * 3,
      Paint()
        ..shader = RadialGradient(
          colors: [
            ChispaColors.halo.withValues(alpha: isGoal ? 0.4 : 0.22),
            ChispaColors.halo.withValues(alpha: 0),
          ],
        ).createShader(Rect.fromCircle(center: offset, radius: r * 3)),
    );

    canvas.drawCircle(
      offset,
      r * 1.2,
      Paint()
        ..color = ChispaColors.corona.withValues(alpha: 0.35)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );

    canvas.drawCircle(
      offset,
      r,
      Paint()
        ..shader = const RadialGradient(
          colors: [ChispaColors.coreCenter, ChispaColors.coreEdge],
        ).createShader(Rect.fromCircle(center: offset, radius: r)),
    );

    canvas.drawCircle(
      Offset(offset.dx - r * 0.2, offset.dy - r * 0.2),
      r * 0.18,
      Paint()..color = const Color(0xFFFFFFFF).withValues(alpha: 0.7),
    );
  }

  @override
  bool containsPoint(Vector2 point) {
    return position.distanceTo(point) < radius + 24;
  }
}
