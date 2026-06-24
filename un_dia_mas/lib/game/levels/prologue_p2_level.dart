import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:un_dia_mas/core/theme/world_themes.dart';
import 'package:un_dia_mas/game/components/chispa_component.dart';
import 'package:un_dia_mas/game/components/meditation_circle_component.dart';
import 'package:un_dia_mas/game/components/trail_path_component.dart';
import 'package:un_dia_mas/game/levels/level_scene.dart';
import 'package:un_dia_mas/game/un_dia_mas_game.dart';
import 'package:un_dia_mas/models/level_definition.dart';

typedef LevelCompleteCallback = void Function(LevelDefinition level);

/// Nivel P2 — El Aliento. Mantén presionado para respirar hasta calmar el pulso.
class PrologueP2Level extends PositionComponent
    with HasGameReference<FlameGame> {
  PrologueP2Level({required this.level, required this.onComplete});

  final LevelDefinition level;
  final LevelCompleteCallback onComplete;

  late ChispaComponent _chispa;
  late PulseDarknessOverlay _pulse;
  late MeditationCircleComponent _circle;

  bool _completed = false;
  double _breatheTime = 0;

  late final double _requiredBreatheSeconds;
  late final double _pulseIntensity;

  double get breatheProgress =>
      (_breatheTime / _requiredBreatheSeconds).clamp(0.0, 1.0);

  @override
  Future<void> onLoad() async {
    size = game.size;
    position = Vector2.zero();

    _requiredBreatheSeconds =
        (level.config['breatheDurationSeconds'] as num?)?.toDouble() ?? 8;
    _pulseIntensity =
        (level.config['pulseIntensity'] as num?)?.toDouble() ?? 0.6;

    final theme = WorldTheme.fromId(level.worldTheme);
    LevelScene.addLandscape(this, theme, variant: 'breath_void', levelNumber: 0);

    final center = Vector2(size.x / 2, size.y * 0.48);

    _circle = MeditationCircleComponent(centerPos: center, radius: 90);
    add(_circle);

    _pulse = PulseDarknessOverlay(intensity: _pulseIntensity)..size = size;
    add(_pulse);

    _chispa = ChispaComponent(position: center, size: 34);
    add(_chispa);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_completed) return;

    final gameRef = game as UnDiaMasGame;
    final breathing = gameRef.breathingHeld;

    _chispa.setBreathingActive(breathing);
    _pulse.calmFactor = breathing ? 1.0 : breatheProgress * 0.5;
    _circle.calmFactor = _pulse.calmFactor;

    if (breathing) _breatheTime += dt;

    if (_breatheTime >= _requiredBreatheSeconds) {
      _completed = true;
      onComplete(level);
    }
  }
}
