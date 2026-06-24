import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart' show Alignment;
import 'package:flutter/painting.dart' show LinearGradient, RadialGradient;
import 'package:un_dia_mas/core/theme/app_colors.dart';
import 'package:un_dia_mas/core/theme/world_themes.dart';

/// Escenario profundo por mundo — capas, parallax visual y variantes por nivel.
class WorldLandscapeBackground extends PositionComponent {
  WorldLandscapeBackground({
    required this.theme,
    this.variant = 'default',
    this.levelNumber = 0,
  });

  final WorldTheme theme;
  final String variant;
  final int levelNumber;

  final math.Random _random = math.Random(42);
  late List<_Star> _stars;
  late List<_FogWisp> _fogWisps;
  late List<_GrassTuft> _grass;
  late List<_Stone> _stones;
  double _time = 0;

  @override
  Future<void> onLoad() async {
    size = parent is PositionComponent
        ? (parent! as PositionComponent).size
        : Vector2(800, 600);
    position = Vector2.zero();

    _stars = List.generate(120, (i) => _Star(
          x: _random.nextDouble(),
          y: _random.nextDouble() * 0.6,
          size: 0.3 + _random.nextDouble() * 2.2,
          twinkle: _random.nextDouble() * math.pi * 2,
          depth: _random.nextDouble(),
        ));

    _fogWisps = List.generate(18, (i) => _FogWisp(
          x: _random.nextDouble(),
          y: 0.25 + _random.nextDouble() * 0.5,
          width: 0.12 + _random.nextDouble() * 0.35,
          height: 30 + _random.nextDouble() * 70,
          speed: 0.015 + _random.nextDouble() * 0.035,
          alpha: 0.03 + _random.nextDouble() * 0.1,
          depth: _random.nextDouble(),
        ));

    _grass = List.generate(40, (i) => _GrassTuft(
          x: _random.nextDouble(),
          y: 0.72 + _random.nextDouble() * 0.25,
          h: 4 + _random.nextDouble() * 10,
        ));

    _stones = List.generate(15, (i) => _Stone(
          x: _random.nextDouble(),
          y: 0.74 + _random.nextDouble() * 0.22,
          r: 2 + _random.nextDouble() * 6,
        ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    _time += dt;
    for (final wisp in _fogWisps) {
      wisp.x += wisp.speed * dt * (0.5 + wisp.depth);
      if (wisp.x > 1.25) wisp.x = -0.25;
    }
  }

  @override
  void render(Canvas canvas) {
    if (theme.id == WorldThemeId.fog) {
      _paintFogWorld(canvas);
    } else {
      _paintPrologueWorld(canvas);
    }
  }

  void _paintPrologueWorld(Canvas canvas) {
    final w = size.x;
    final h = size.y;
    final horizon = h * 0.7;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Color(0xFF02020A),
            Color(0xFF08081A),
            Color(0xFF10102A),
            Color(0xFF1A1520),
          ],
          stops: const [0.0, 0.35, 0.65, 1.0],
        ).createShader(Rect.fromLTWH(0, 0, w, h)),
    );

    _drawNebula(canvas, w, h);

    for (final star in _stars) {
      final tw = 0.3 + 0.7 * ((math.sin(_time * (1 + star.depth) + star.twinkle) + 1) / 2);
      canvas.drawCircle(
        Offset(star.x * w, star.y * h),
        star.size * (0.5 + star.depth),
        Paint()..color = ChispaColors.halo.withValues(alpha: 0.08 + tw * 0.2),
      );
    }

    _drawMountainLayer(canvas, w, h, horizon, 0.14, const Color(0xFF0A0A14), 0, 0.3);
    _drawMountainLayer(canvas, w, h, horizon, 0.1, const Color(0xFF12101C), 40, 0.5);
    _drawMountainLayer(canvas, w, h, horizon, 0.07, const Color(0xFF18141F), 80, 0.8);

    canvas.drawOval(
      Rect.fromCenter(center: Offset(w * 0.5, horizon), width: w * 1.6, height: 50),
      Paint()
        ..shader = RadialGradient(
          colors: [
            ChispaColors.halo.withValues(alpha: 0.08),
            const Color(0x00000000),
          ],
        ).createShader(Rect.fromCenter(center: Offset(w * 0.5, horizon), width: w, height: 80)),
    );

    _drawGround(canvas, w, h, horizon, const Color(0xFF0C0A10), const Color(0xFF141018));
    _drawGrassTufts(canvas, w, h, 0.35);
    _drawStones(canvas, w, h, 0.25);
  }

  void _paintFogWorld(Canvas canvas) {
    final w = size.x;
    final h = size.y;
    final horizon = h * 0.58;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Color(0xFF141E2C),
            Color(0xFF243040),
            Color(0xFF3A4A5C),
            Color(0xFF4A5A68),
          ],
          stops: const [0.0, 0.3, 0.6, 1.0],
        ).createShader(Rect.fromLTWH(0, 0, w, h)),
    );

    _drawMountainLayer(canvas, w, h, horizon, 0.16, const Color(0xFF1A2430), 0, 0.25);
    _drawMountainLayer(canvas, w, h, horizon * 1.02, 0.12, const Color(0xFF222C38), 60, 0.45);
    _drawMountainLayer(canvas, w, h, horizon * 1.04, 0.09, const Color(0xFF2A3540), 120, 0.7);

    if (variant == 'beacon_hill' || levelNumber >= 6) {
      _drawBeaconTower(canvas, w * 0.88, h * 0.52);
    }

    _drawFogTrees(canvas, w, h);
    _drawVariantProps(canvas, w, h);
    _drawWindingPath(canvas, w, h);
    _drawGround(canvas, w, h, h * 0.76, const Color(0xFF1A222C), const Color(0xFF242E38));
    _drawGrassTufts(canvas, w, h, 0.2);
    _drawStones(canvas, w, h, 0.4);

    for (final wisp in _fogWisps) {
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(wisp.x * w, wisp.y * h),
          width: wisp.width * w,
          height: wisp.height,
        ),
        Paint()..color = WorldColors.fogMist.withValues(alpha: wisp.alpha * (1.2 - wisp.depth * 0.5)),
      );
    }

    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h * 0.35),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            WorldColors.fogMist.withValues(alpha: 0.12),
            const Color(0x00000000),
          ],
        ).createShader(Rect.fromLTWH(0, 0, w, h * 0.35)),
    );
  }

  void _drawNebula(Canvas canvas, double w, double h) {
    for (var i = 0; i < 3; i++) {
      final nx = w * (0.2 + i * 0.3) + math.sin(_time * 0.1 + i) * 20;
      final ny = h * (0.15 + i * 0.08);
      canvas.drawOval(
        Rect.fromCenter(center: Offset(nx, ny), width: 180, height: 60),
        Paint()
          ..color = Color.lerp(
            const Color(0xFF1A1040),
            ChispaColors.corona,
            0.3,
          )!.withValues(alpha: 0.06),
      );
    }
  }

  void _drawMountainLayer(
    Canvas canvas, double w, double h, double baseY, double height,
    Color color, double offset, double parallax,
  ) {
    final path = Path();
    path.moveTo(0, h);
    path.lineTo(0, baseY);
    for (var x = 0.0; x <= w; x += 15) {
      path.lineTo(
        x,
        baseY -
            math.sin((x + offset + _time * 8 * parallax) * 0.003) * h * height -
            math.sin((x + offset) * 0.008) * h * height * 0.5,
      );
    }
    path.lineTo(w, h);
    path.close();
    canvas.drawPath(path, Paint()..color = color);
  }

  void _drawGround(Canvas canvas, double w, double h, double horizon, Color top, Color bottom) {
    final ground = Path();
    ground.moveTo(0, horizon);
    for (var x = 0.0; x <= w; x += 25) {
      ground.lineTo(x, horizon + math.sin(x * 0.015 + _time * 0.2) * 5);
    }
    ground.lineTo(w, h);
    ground.lineTo(0, h);
    ground.close();
    canvas.drawPath(
      ground,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [top, bottom],
        ).createShader(Rect.fromLTWH(0, horizon, w, h - horizon)),
    );
  }

  void _drawGrassTufts(Canvas canvas, double w, double h, double alpha) {
    for (final g in _grass) {
      final gx = g.x * w;
      final gy = g.y * h;
      final sway = math.sin(_time * 1.2 + g.x * 10) * 2;
      canvas.drawLine(
        Offset(gx, gy),
        Offset(gx + sway, gy - g.h),
        Paint()
          ..color = const Color(0xFF3A4A38).withValues(alpha: alpha)
          ..strokeWidth = 1.5
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  void _drawStones(Canvas canvas, double w, double h, double alpha) {
    for (final s in _stones) {
      canvas.drawOval(
        Rect.fromCenter(center: Offset(s.x * w, s.y * h), width: s.r * 2.5, height: s.r * 1.5),
        Paint()..color = const Color(0xFF4A5560).withValues(alpha: alpha),
      );
    }
  }

  void _drawFogTrees(Canvas canvas, double w, double h) {
    final positions = [0.08, 0.22, 0.48, 0.65, 0.78, 0.92];
    final heights = [55.0, 40.0, 70.0, 45.0, 60.0, 38.0];
    for (var i = 0; i < positions.length; i++) {
      _drawTree(canvas, w * positions[i], h * 0.68, heights[i], const Color(0xFF101820));
    }
  }

  void _drawTree(Canvas canvas, double x, double baseY, double height, Color color) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(x, baseY - height * 0.28), width: 7, height: height * 0.45),
        const Radius.circular(2),
      ),
      Paint()..color = color,
    );
    final branches = Path();
    branches.moveTo(x, baseY - height * 0.5);
    branches.lineTo(x - height * 0.28, baseY - height * 0.08);
    branches.moveTo(x, baseY - height * 0.65);
    branches.lineTo(x + height * 0.22, baseY - height * 0.18);
    branches.moveTo(x, baseY - height * 0.82);
    branches.lineTo(x - height * 0.18, baseY - height * 0.42);
    canvas.drawPath(
      branches,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round,
    );
  }

  void _drawBeaconTower(Canvas canvas, double x, double baseY) {
    canvas.drawRect(
      Rect.fromLTWH(x - 8, baseY - 90, 16, 90),
      Paint()..color = const Color(0xFF1A2030),
    );
    canvas.drawRect(
      Rect.fromLTWH(x - 14, baseY - 100, 28, 12),
      Paint()..color = const Color(0xFF252D3A),
    );
    canvas.drawCircle(
      Offset(x, baseY - 106),
      10,
      Paint()
        ..color = ChispaColors.halo.withValues(alpha: 0.15 + math.sin(_time * 2) * 0.08)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );
  }

  void _drawWindingPath(Canvas canvas, double w, double h) {
    final pathY = h * 0.8;
    final path = Path();
    path.moveTo(0, pathY);
    for (var x = 0.0; x <= w; x += 20) {
      path.lineTo(x, pathY + math.sin(x * 0.007) * 14 + x * 0.015);
    }
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();
    canvas.drawPath(path, Paint()..color = const Color(0xFF1E2834).withValues(alpha: 0.85));

    if (variant == 'three_paths') {
      for (final branch in [0.25, 0.5, 0.75]) {
        final bx = w * branch;
        canvas.drawLine(
          Offset(bx, pathY),
          Offset(bx + 40, pathY - 60),
          Paint()
            ..color = const Color(0xFF3A4A58).withValues(alpha: 0.4)
            ..strokeWidth = 8
            ..strokeCap = StrokeCap.round,
        );
      }
    }
  }

  void _drawVariantProps(Canvas canvas, double w, double h) {
    if (variant == 'broken_compass') {
      _drawCompass(canvas, Offset(w * 0.45, h * 0.82));
    } else if (variant == 'note_tree') {
      _drawPaperNote(canvas, Offset(w * 0.35, h * 0.75));
    } else if (variant == 'rest_chair') {
      _drawChair(canvas, Offset(w * 0.5, h * 0.8));
    } else if (variant == 'clock_post') {
      _drawClockPost(canvas, Offset(w * 0.6, h * 0.72));
    } else if (variant == 'stone_circle') {
      for (var i = 0; i < 5; i++) {
        final a = i / 5 * math.pi * 2;
        canvas.drawCircle(
          Offset(w * 0.5 + math.cos(a) * 50, h * 0.78 + math.sin(a) * 20),
          6,
          Paint()..color = const Color(0xFF4A5A68).withValues(alpha: 0.5),
        );
      }
    } else if (variant == 'bridge_gap') {
      _drawBridge(canvas, w * 0.5, h * 0.77, w * 0.35);
    } else if (variant == 'stone_cairn') {
      _drawStoneCairn(canvas, Offset(w * 0.38, h * 0.81));
      _drawStoneCairn(canvas, Offset(w * 0.42, h * 0.8), small: true);
    } else if (variant == 'mirror_pond') {
      _drawPond(canvas, Offset(w * 0.5, h * 0.8), 70);
    } else if (variant == 'lantern_post') {
      _drawLanternPost(canvas, Offset(w * 0.42, h * 0.74));
    } else if (variant == 'carved_stones') {
      _drawCarvedStone(canvas, Offset(w * 0.35, h * 0.82));
      _drawCarvedStone(canvas, Offset(w * 0.55, h * 0.8));
    }
  }

  void _drawCompass(Canvas canvas, Offset c) {
    canvas.drawCircle(c, 14, Paint()..color = const Color(0xFF3A4550));
    canvas.drawCircle(c, 12, Paint()..color = const Color(0xFF5A6570).withValues(alpha: 0.6));
    canvas.drawLine(
      c,
      c + const Offset(0, -10),
      Paint()
        ..color = ChispaColors.corona
        ..strokeWidth = 2,
    );
    canvas.drawLine(
      c,
      c + const Offset(8, 6),
      Paint()
        ..color = const Color(0xFF888888)
        ..strokeWidth = 1.5,
    );
  }

  void _drawPaperNote(Canvas canvas, Offset c) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromCenter(center: c, width: 18, height: 22), const Radius.circular(2)),
      Paint()..color = const Color(0xFFD4C8B0).withValues(alpha: 0.5),
    );
  }

  void _drawChair(Canvas canvas, Offset c) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromCenter(center: c + const Offset(0, -8), width: 24, height: 4), const Radius.circular(1)),
      Paint()..color = const Color(0xFF3A3540),
    );
    canvas.drawRect(Rect.fromLTWH(c.dx - 10, c.dy - 8, 3, 16), Paint()..color = const Color(0xFF2A2530));
    canvas.drawRect(Rect.fromLTWH(c.dx + 7, c.dy - 8, 3, 16), Paint()..color = const Color(0xFF2A2530));
  }

  void _drawClockPost(Canvas canvas, Offset c) {
    canvas.drawRect(
      Rect.fromCenter(center: c, width: 4, height: 40),
      Paint()..color = const Color(0xFF3A4048),
    );
    canvas.drawCircle(c.translate(0, -22), 12, Paint()..color = const Color(0xFF4A5560));
    canvas.drawLine(
      c.translate(0, -22),
      c.translate(0, -28),
      Paint()
        ..color = ChispaColors.halo
        ..strokeWidth = 1.5,
    );
  }

  void _drawBridge(Canvas canvas, double cx, double cy, double width) {
    canvas.drawRect(
      Rect.fromCenter(center: Offset(cx, cy), width: width, height: 6),
      Paint()..color = const Color(0xFF3A3540),
    );
    for (var i = 0; i < 5; i++) {
      canvas.drawRect(
        Rect.fromLTWH(cx - width / 2 + i * (width / 5), cy - 2, 3, 10),
        Paint()..color = const Color(0xFF2A2830),
      );
    }
  }

  void _drawStoneCairn(Canvas canvas, Offset base, {bool small = false}) {
    final s = small ? 0.6 : 1.0;
    for (var i = 0; i < 3; i++) {
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(base.dx, base.dy - i * 8 * s),
          width: (18 - i * 3) * s,
          height: (10 - i * 2) * s,
        ),
        Paint()..color = Color(0xFF5A6570).withValues(alpha: 0.5 + i * 0.1),
      );
    }
  }

  void _drawPond(Canvas canvas, Offset c, double r) {
    canvas.drawOval(
      Rect.fromCenter(center: c, width: r * 2, height: r * 0.6),
      Paint()..color = const Color(0xFF3A5A7A).withValues(alpha: 0.6),
    );
    canvas.drawOval(
      Rect.fromCenter(center: c.translate(0, -2), width: r * 1.2, height: r * 0.25),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF87CEEB).withValues(alpha: 0.35),
            const Color(0xFF3A5A7A).withValues(alpha: 0.1),
          ],
        ).createShader(Rect.fromCenter(center: c, width: r, height: r * 0.3)),
    );
  }

  void _drawLanternPost(Canvas canvas, Offset base) {
    canvas.drawRect(
      Rect.fromCenter(center: base, width: 4, height: 35),
      Paint()..color = const Color(0xFF3A3540),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: base.translate(0, -22), width: 16, height: 20),
        const Radius.circular(3),
      ),
      Paint()..color = const Color(0xFF4A5560),
    );
    canvas.drawCircle(
      base.translate(0, -22),
      6,
      Paint()..color = ChispaColors.halo.withValues(alpha: 0.08),
    );
  }

  void _drawCarvedStone(Canvas canvas, Offset c) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: c, width: 28, height: 18),
        const Radius.circular(4),
      ),
      Paint()..color = const Color(0xFF4A5560).withValues(alpha: 0.7),
    );
    canvas.drawLine(
      c.translate(-6, -2),
      c.translate(6, -2),
      Paint()
        ..color = ChispaColors.halo.withValues(alpha: 0.2)
        ..strokeWidth = 1,
    );
  }
}

class _Star {
  _Star({required this.x, required this.y, required this.size, required this.twinkle, required this.depth});
  final double x, y, size, twinkle, depth;
}

class _FogWisp {
  _FogWisp({required this.x, required this.y, required this.width, required this.height, required this.speed, required this.alpha, required this.depth});
  double x;
  final double y, width, height, speed, alpha, depth;
}

class _GrassTuft {
  _GrassTuft({required this.x, required this.y, required this.h});
  final double x, y, h;
}

class _Stone {
  _Stone({required this.x, required this.y, required this.r});
  final double x, y, r;
}
