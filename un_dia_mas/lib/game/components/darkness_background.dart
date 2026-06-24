import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:un_dia_mas/core/theme/app_colors.dart';
import 'package:un_dia_mas/core/theme/world_themes.dart';

/// Fondo oscuro con partículas ambientales — capa base de todo nivel.
class DarknessBackground extends Component {
  DarknessBackground({required this.theme});

  final WorldTheme theme;
  final List<_AmbientParticle> _particles = [];
  final Random _random = Random();

  @override
  Future<void> onLoad() async {
    final parentSize = parent is PositionComponent
        ? (parent! as PositionComponent).size
        : Vector2(800, 600);

    for (var i = 0; i < theme.particleCount; i++) {
      _particles.add(_AmbientParticle(
        x: _random.nextDouble() * parentSize.x,
        y: _random.nextDouble() * parentSize.y,
        size: 0.5 + _random.nextDouble() * 1.5,
        alpha: 0.05 + _random.nextDouble() * 0.15,
        drift: _random.nextDouble() * 0.3,
      ));
    }
  }

  @override
  void render(Canvas canvas) {
    final size = parent is PositionComponent
        ? (parent! as PositionComponent).size
        : Vector2(800, 600);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      Paint()..color = theme.backgroundColor,
    );

    for (final p in _particles) {
      canvas.drawCircle(
        Offset(p.x, p.y),
        p.size,
        Paint()..color = ChispaColors.halo.withValues(alpha: p.alpha),
      );
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    final size = parent is PositionComponent
        ? (parent! as PositionComponent).size
        : Vector2(800, 600);

    for (final p in _particles) {
      p.y -= p.drift * dt * 10;
      if (p.y < 0) {
        p.y = size.y;
        p.x = _random.nextDouble() * size.x;
      }
    }
  }
}

class _AmbientParticle {
  _AmbientParticle({
    required this.x,
    required this.y,
    required this.size,
    required this.alpha,
    required this.drift,
  });

  double x;
  double y;
  final double size;
  final double alpha;
  final double drift;
}
