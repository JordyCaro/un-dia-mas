import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart' show Alignment, Colors;
import 'package:flutter/painting.dart' show RadialGradient;
import 'package:un_dia_mas/core/theme/app_colors.dart';

/// La Chispa — un ser de luz pequeño, empático, dibujado con Canvas.
/// Forma orgánica, ojos expresivos, tentáculos suaves y respiración viva.
class ChispaComponent extends PositionComponent {
  ChispaComponent({
    required Vector2 position,
    double size = 28,
  })  : _baseSize = size,
        super(
          position: position,
          size: Vector2.all(size * 5.5),
          anchor: Anchor.center,
        );

  final double _baseSize;
  final List<_TrailParticle> _trail = [];
  final Random _random = Random();

  double _breathPhase = 0;
  double _flickerPhase = 0;
  double _blinkPhase = 0;
  double _nextBlink = 3.5;
  double _blinkProgress = 0;
  double _idleTime = 0;
  double _breathingBoost = 0;
  bool _isMoving = false;
  double _faceAngle = 0;
  double _bobOffset = 0;

  static const double _breathSpeed = 1.3;

  @override
  Future<void> onLoad() async {
    _nextBlink = 2 + _random.nextDouble() * 4;
  }

  void setVelocity(Vector2 velocity) {
    _isMoving = velocity.length > 8;
    if (_isMoving) {
      _idleTime = 0;
      _faceAngle = atan2(velocity.y, velocity.x) * 0.15;
    }
  }

  void setBreathingActive(bool active) {
    _breathingBoost = active ? 1.0 : 0.0;
  }

  @override
  void update(double dt) {
    super.update(dt);
    _breathPhase += dt * _breathSpeed;
    _flickerPhase += dt * 7;
    _bobOffset = sin(_breathPhase * 0.8) * 3;

    if (!_isMoving) {
      _idleTime += dt;
      _faceAngle *= 0.95;
    }

    _blinkPhase += dt;
    if (_blinkPhase >= _nextBlink && _blinkProgress == 0) {
      _blinkProgress = 0.001;
    }
    if (_blinkProgress > 0) {
      _blinkProgress += dt * 6;
      if (_blinkProgress >= 1) {
        _blinkProgress = 0;
        _blinkPhase = 0;
        _nextBlink = 3 + _random.nextDouble() * 5;
      }
    }

    if (_isMoving) {
      _trail.add(_TrailParticle(position: position.clone(), life: 1));
      if (_trail.length > 20) _trail.removeAt(0);
    }
    for (final p in _trail) {
      p.life -= dt * 0.9;
    }
    _trail.removeWhere((p) => p.life <= 0);
  }

  double get _blinkClose {
    if (_blinkProgress <= 0) return 0;
    if (_blinkProgress < 0.5) return _blinkProgress * 2;
    return (1 - _blinkProgress) * 2;
  }

  @override
  void render(Canvas canvas) {
    final center = size / 2;
    final breath = sin(_breathPhase);
    final flicker = 0.94 + 0.06 * sin(_flickerPhase);
    final scale = (1.0 + breath * 0.05 + _breathingBoost * 0.1) * flicker;
    final leanX = _faceAngle.clamp(-0.4, 0.4);

    for (final p in _trail) {
      canvas.drawCircle(
        Offset(p.position.x - position.x + center.x, p.position.y - position.y + center.y),
        _baseSize * 0.2 * p.life,
        Paint()
          ..color = ChispaColors.trail.withValues(alpha: p.life * 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
      );
    }

    canvas.save();
    canvas.translate(center.x, center.y + _bobOffset);
    canvas.rotate(leanX);
    canvas.scale(_isMoving ? 1.06 : 1.0, scale);

    _drawAura(canvas, breath);
    _drawTendrils(canvas, breath);
    _drawBody(canvas, breath);
    _drawEyes(canvas, breath);
    _drawCoreGlow(canvas, breath);

    canvas.restore();
  }

  void _drawAura(Canvas canvas, double breath) {
    final r = _baseSize * 3.4 * (1 + _breathingBoost * 0.15);
    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: r * 2.2, height: r * 2.6),
      Paint()
        ..shader = RadialGradient(
          colors: [
            ChispaColors.halo.withValues(alpha: 0.2 + _breathingBoost * 0.1),
            ChispaColors.corona.withValues(alpha: 0.05),
            const Color(0x00000000),
          ],
          stops: const [0.0, 0.4, 1.0],
        ).createShader(Rect.fromCircle(center: Offset.zero, radius: r)),
    );
  }

  void _drawTendrils(Canvas canvas, double breath) {
    for (var i = -1; i <= 1; i += 2) {
      final sway = sin(_breathPhase * 1.5 + i) * 4;
      final path = Path()
        ..moveTo(i * _baseSize * 0.15, _baseSize * 0.5)
        ..quadraticBezierTo(
          i * _baseSize * 0.35 + sway,
          _baseSize * 0.85,
          i * _baseSize * 0.2 + sway * 0.5,
          _baseSize * 1.1,
        );
      canvas.drawPath(
        path,
        Paint()
          ..color = ChispaColors.coreEdge.withValues(alpha: 0.35 + breath * 0.1)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5
          ..strokeCap = StrokeCap.round
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2),
      );
    }
  }

  void _drawBody(Canvas canvas, double breath) {
    final h = _baseSize * (1.1 + breath * 0.04);
    final w = _baseSize * 0.85;

    final body = Path()
      ..moveTo(0, -h * 0.95)
      ..quadraticBezierTo(w * 0.9, -h * 0.3, w * 0.55, h * 0.35)
      ..quadraticBezierTo(w * 0.2, h * 0.75, 0, h * 0.95)
      ..quadraticBezierTo(-w * 0.2, h * 0.75, -w * 0.55, h * 0.35)
      ..quadraticBezierTo(-w * 0.9, -h * 0.3, 0, -h * 0.95)
      ..close();

    canvas.drawPath(
      body,
      Paint()
        ..shader = RadialGradient(
          center: Alignment(0, -0.3),
          colors: [
            ChispaColors.coreCenter.withValues(alpha: 0.95),
            ChispaColors.coreEdge.withValues(alpha: 0.85),
            ChispaColors.corona.withValues(alpha: 0.4),
          ],
          stops: const [0.0, 0.55, 1.0],
        ).createShader(Rect.fromCenter(
          center: Offset.zero,
          width: w * 2,
          height: h * 2,
        )),
    );

    canvas.drawPath(
      body,
      Paint()
        ..color = ChispaColors.halo.withValues(alpha: 0.12 + breath * 0.05)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1),
    );
  }

  void _drawEyes(Canvas canvas, double breath) {
    final eyeOpen = (1 - _blinkClose).clamp(0.05, 1.0);
    final eyeY = -_baseSize * 0.15;
    final eyeSpacing = _baseSize * 0.22;
    final lookX = _faceAngle * 3;

    for (final side in [-1.0, 1.0]) {
      final ex = side * eyeSpacing + lookX;
      final eyeH = _baseSize * 0.14 * eyeOpen;

      canvas.drawOval(
        Rect.fromCenter(center: Offset(ex, eyeY), width: _baseSize * 0.16, height: eyeH),
        Paint()..color = const Color(0xFF2A1A10).withValues(alpha: 0.55 * eyeOpen),
      );

      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(ex + 1, eyeY - 1),
          width: _baseSize * 0.07 * eyeOpen,
          height: eyeH * 0.45,
        ),
        Paint()..color = Colors.white.withValues(alpha: 0.75 * eyeOpen),
      );
    }

    if (_idleTime > 2 && !_isMoving && eyeOpen > 0.5) {
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(0, _baseSize * 0.08),
          width: _baseSize * 0.12,
          height: _baseSize * 0.06,
        ),
        0.1,
        pi - 0.2,
        false,
        Paint()
          ..color = ChispaColors.coreEdge.withValues(alpha: 0.25)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  void _drawCoreGlow(Canvas canvas, double breath) {
    canvas.drawCircle(
      Offset(0, -_baseSize * 0.35),
      _baseSize * 0.22,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.5 + breath * 0.15)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );
  }
}

class _TrailParticle {
  _TrailParticle({required this.position, required this.life});
  Vector2 position;
  double life;
}
