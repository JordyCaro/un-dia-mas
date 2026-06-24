import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:un_dia_mas/core/theme/app_colors.dart';

/// Sendero invisible que solo se revela cerca de la chispa.
class PathRevealComponent extends Component {
  PathRevealComponent({
    required this.pathPoints,
    required this.lightPosition,
    required this.revealRadius,
  });

  final List<Vector2> pathPoints;
  Vector2 lightPosition;
  final double revealRadius;

  @override
  void render(Canvas canvas) {
    for (var i = 0; i < pathPoints.length; i++) {
      final p = pathPoints[i];
      final dist = p.distanceTo(lightPosition);
      if (dist > revealRadius) continue;
      final t = 1 - (dist / revealRadius);
      canvas.drawCircle(
        Offset(p.x, p.y),
        3 + t * 2,
        Paint()..color = ChispaColors.halo.withValues(alpha: 0.15 + t * 0.35),
      );
      if (i > 0) {
        final prev = pathPoints[i - 1];
        if (prev.distanceTo(lightPosition) <= revealRadius) {
          canvas.drawLine(
            Offset(prev.x, prev.y),
            Offset(p.x, p.y),
            Paint()
              ..color = ChispaColors.halo.withValues(alpha: 0.1 + t * 0.2)
              ..strokeWidth = 2
              ..strokeCap = StrokeCap.round,
          );
        }
      }
    }
  }

  static List<Vector2> buildPath(Vector2 from, Vector2 to, int steps) {
    final points = <Vector2>[];
    for (var i = 0; i <= steps; i++) {
      final t = i / steps;
      final midY = math.min(from.y, to.y) - 30;
      final x = from.x + (to.x - from.x) * t;
      final y = from.y + (to.y - from.y) * t + math.sin(t * math.pi) * (midY - from.y) * 0.3;
      points.add(Vector2(x, y));
    }
    return points;
  }
}
