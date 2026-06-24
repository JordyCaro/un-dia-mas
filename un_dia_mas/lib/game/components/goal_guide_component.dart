import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:un_dia_mas/core/theme/app_colors.dart';

/// Guía visual hacia el objetivo — línea punteada y flecha animada.
class GoalGuideComponent extends Component {
  GoalGuideComponent({
    required this.chispaPosition,
    required this.goalPosition,
    this.enabled = true,
  });

  Vector2 chispaPosition;
  Vector2 goalPosition;
  bool enabled;

  double _phase = 0;
  double _idleTime = 0;

  @override
  void update(double dt) {
    super.update(dt);
    _phase += dt * 2.5;
    _idleTime += dt;
  }

  @override
  void render(Canvas canvas) {
    if (!enabled) return;

    final from = Offset(chispaPosition.x, chispaPosition.y);
    final to = Offset(goalPosition.x, goalPosition.y);
    final distance = (to - from).distance;
    if (distance < 48) return;

    // Línea punteada suave
    final dashPaint = Paint()
      ..color = ChispaColors.halo.withValues(alpha: 0.25 + math.sin(_phase) * 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const dashLength = 12.0;
    const gapLength = 10.0;
    final direction = (to - from) / distance;
    var traveled = (_phase * 30) % (dashLength + gapLength);

    while (traveled < distance - 40) {
      final start = from + direction * traveled;
      final end = from + direction * math.min(traveled + dashLength, distance - 30);
      canvas.drawLine(start, end, dashPaint);
      traveled += dashLength + gapLength;
    }

    // Anillo en el objetivo
    final ringRadius = 28 + math.sin(_phase) * 4;
    canvas.drawCircle(
      to,
      ringRadius,
      Paint()
        ..color = ChispaColors.halo.withValues(alpha: 0.2)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    // Flecha flotante a mitad de camino (si el jugador lleva poco moviéndose)
    if (_idleTime < 12) {
      final mid = Offset(
        (from.dx + to.dx) / 2,
        (from.dy + to.dy) / 2 - 20 - math.sin(_phase) * 6,
      );
      _drawArrow(canvas, mid, math.atan2(to.dy - from.dy, to.dx - from.dx));
    }
  }

  void _drawArrow(Canvas canvas, Offset center, double angle) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle);

    final path = Path()
      ..moveTo(14, 0)
      ..lineTo(-8, -10)
      ..lineTo(-4, 0)
      ..lineTo(-8, 10)
      ..close();

    canvas.drawPath(
      path,
      Paint()..color = ChispaColors.halo.withValues(alpha: 0.55),
    );
    canvas.restore();
  }

  void onPlayerMoved() => _idleTime = 0;
}
