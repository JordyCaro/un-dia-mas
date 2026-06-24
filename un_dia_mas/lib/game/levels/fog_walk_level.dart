import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:un_dia_mas/core/theme/world_themes.dart';
import 'package:un_dia_mas/game/components/chispa_component.dart';
import 'package:un_dia_mas/game/components/goal_guide_component.dart';
import 'package:un_dia_mas/game/components/light_mask_overlay.dart';
import 'package:un_dia_mas/game/components/light_mote_component.dart';
import 'package:un_dia_mas/game/components/path_reveal_component.dart';
import 'package:un_dia_mas/game/levels/level_scene.dart';
import 'package:un_dia_mas/game/levels/walk_movement.dart';
import 'package:un_dia_mas/models/level_definition.dart';

typedef LevelCompleteCallback = void Function(LevelDefinition level);

/// Nivel genérico de La Niebla — spawn, meta y variantes desde JSON.
class FogWalkLevel extends PositionComponent
    with HasGameReference<FlameGame>, WalkMovement {
  FogWalkLevel({required this.level, required this.onComplete});

  final LevelDefinition level;
  final LevelCompleteCallback onComplete;

  late ChispaComponent _chispa;
  late LightMoteComponent _goal;
  late LightMaskOverlay _lightMask;
  late GoalGuideComponent _guide;
  PathRevealComponent? _pathReveal;
  late WorldTheme _theme;
  Vector2? _pondPosition;
  double _pondClearRadius = 0;
  Vector2? _pickupPosition;
  double _lightBoost = 0;
  bool _lanternLit = false;

  @override
  late final ChispaComponent walkChispa;
  @override
  bool walkCompleted = false;
  Vector2? _lastPos;

  @override
  Future<void> onLoad() async {
    size = game.size;
    position = Vector2.zero();

    _theme = WorldTheme.fromId(level.worldTheme);
    final lightRadius =
        (level.config['lightRadius'] as num?)?.toDouble() ?? _theme.lightRadius;
    final fogDensity =
        (level.config['fogDensity'] as num?)?.toDouble() ?? _theme.fogDensity;
    _theme = _theme.copyWith(lightRadius: lightRadius, fogDensity: fogDensity);

    final variant = level.config['landscapeVariant'] as String? ?? 'default';

    LevelScene.addLandscape(
      this,
      _theme,
      variant: variant,
      levelNumber: level.levelNumber,
    );

    final spawn = _posFromConfig('spawnPosition', {'x': 0.12, 'y': 0.78});
    final goalPos = _posFromConfig('goalPosition', {'x': 0.85, 'y': 0.72});

    _chispa = ChispaComponent(position: spawn, size: 24);
    walkChispa = _chispa;
    add(_chispa);

    _goal = LightMoteComponent(
      position: goalPos,
      radius: (level.config['goalRadius'] as num?)?.toDouble() ?? 34,
      isGoal: true,
    );
    add(_goal);

    _guide = LevelScene.addGoalGuide(this, spawn, goalPos);
    _lightMask = LevelScene.addFogMask(this, _theme, spawn, size)!;

    if (level.mechanic == 'invisible_path') {
      final revealRadius =
          (level.config['pathRevealRadius'] as num?)?.toDouble() ?? 100;
      final pathPoints = PathRevealComponent.buildPath(spawn, goalPos, 24);
      _pathReveal = PathRevealComponent(
        pathPoints: pathPoints,
        lightPosition: spawn,
        revealRadius: revealRadius,
      )..priority = 10;
      add(_pathReveal!);
    }

    if (level.mechanic == 'mirror_pond') {
      _pondPosition = _posFromConfig('pondPosition', {'x': 0.5, 'y': 0.78});
      _pondClearRadius =
          (level.config['pondClearRadius'] as num?)?.toDouble() ?? 120;
    }

    if (level.mechanic == 'lantern_boost') {
      _pickupPosition =
          _posFromConfig('pickupPosition', {'x': 0.42, 'y': 0.76});
      _lightBoost =
          (level.config['lightRadiusBoost'] as num?)?.toDouble() ?? 40;
    }
  }

  Vector2 _posFromConfig(String key, Map<String, double> fallback) {
    final raw = level.config[key] as Map<String, dynamic>?;
    if (raw != null) {
      return normalizedToWorld(raw);
    }
    return normalizedToWorld(fallback);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (walkCompleted) return;
    applyMovementInput(dt);

    if (_lastPos != null && _lastPos!.distanceTo(_chispa.position) > 2) {
      _guide.onPlayerMoved();
    }
    _lastPos = _chispa.position.clone();

    _guide.chispaPosition = _chispa.position;
    _guide.goalPosition = _goal.position;
    _lightMask.lightPosition = _chispa.position;
    _pathReveal?.lightPosition = _chispa.position;

    var extraLight = 0.0;
    if (_pondPosition != null &&
        _chispa.position.distanceTo(_pondPosition!) < _pondClearRadius) {
      extraLight += _pondClearRadius * 0.35;
    }
    if (_lanternLit) {
      extraLight += _lightBoost;
    } else if (_pickupPosition != null &&
        _chispa.position.distanceTo(_pickupPosition!) < 36) {
      _lanternLit = true;
      extraLight += _lightBoost;
    }
    _lightMask.extraRadius = extraLight;

    if (_goal.containsPoint(_chispa.position)) {
      walkCompleted = true;
      _goal.reached = true;
      _guide.enabled = false;
      onComplete(level);
    }
  }
}
