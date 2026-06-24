import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:un_dia_mas/core/theme/app_colors.dart';

/// Sendero luminoso que se dibuja donde camina la chispa.
class TrailPathComponent extends Component {
  TrailPathComponent({this.maxPoints = 400});

  final int maxPoints;
  final List<Vector2> _points = [];
  Vector2? _lastRecorded;

  static const double _minDistance = 6;

  void recordPosition(Vector2 position) {
    if (_lastRecorded != null &&
        _lastRecorded!.distanceTo(position) < _minDistance) {
      return;
    }
    _points.add(position.clone());
    _lastRecorded = position.clone();
    if (_points.length > maxPoints) {
      _points.removeAt(0);
    }
  }

  @override
  void render(Canvas canvas) {
    if (_points.length < 2) return;

    for (var i = 1; i < _points.length; i++) {
      final t = i / _points.length;
      final paint = Paint()
        ..color = ChispaColors.halo.withValues(alpha: 0.08 + t * 0.25)
        ..strokeWidth = 2 + t * 4
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
      canvas.drawLine(
        Offset(_points[i - 1].x, _points[i - 1].y),
        Offset(_points[i].x, _points[i].y),
        paint,
      );
    }

    for (var i = 0; i < _points.length; i += 8) {
      final t = i / _points.length;
      final paint = Paint()
        ..color = ChispaColors.spark.withValues(alpha: 0.15 + t * 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
      canvas.drawCircle(
        Offset(_points[i].x, _points[i].y),
        3 + t * 2,
        paint,
      );
    }
  }
}

/// Pulso de oscuridad para P2 — se calma al respirar.
class PulseDarknessOverlay extends PositionComponent {
  PulseDarknessOverlay({
    required this.intensity,
    this.calmFactor = 0,
  });

  final double intensity;
  double calmFactor;
  double _phase = 0;

  @override
  void update(double dt) {
    super.update(dt);
    _phase += dt;
  }

  @override
  void render(Canvas canvas) {
    final pulse = (math.sin(_phase * 2.2) + 1) / 2;
    final effectiveIntensity = intensity * (1 - calmFactor * 0.75);
    final alpha = 0.15 + pulse * effectiveIntensity * 0.35;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      Paint()..color = const Color(0xFF000000).withValues(alpha: alpha),
    );
  }
}
