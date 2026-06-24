import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:un_dia_mas/core/theme/world_themes.dart';
import 'package:un_dia_mas/game/components/chispa_component.dart';
import 'package:un_dia_mas/game/components/goal_guide_component.dart';
import 'package:un_dia_mas/game/components/light_mask_overlay.dart';
import 'package:un_dia_mas/game/components/light_mote_component.dart';
import 'package:un_dia_mas/game/levels/level_scene.dart';
import 'package:un_dia_mas/game/levels/walk_movement.dart';
import 'package:un_dia_mas/models/level_definition.dart';

typedef LevelCompleteCallback = void Function(LevelDefinition level);

class PrologueP1Level extends PositionComponent
    with HasGameReference<FlameGame>, WalkMovement {
  PrologueP1Level({required this.level, required this.onComplete});

  final LevelDefinition level;
  final LevelCompleteCallback onComplete;

  late ChispaComponent _chispa;
  late LightMoteComponent _goal;
  late GoalGuideComponent _guide;
  LightMaskOverlay? _lightMask;

  @override
  late final ChispaComponent walkChispa;
  @override
  bool walkCompleted = false;
  Vector2? _lastPos;

  @override
  Future<void> onLoad() async {
    size = game.size;
    position = Vector2.zero();

    final theme = WorldTheme.fromId(level.worldTheme);
    LevelScene.addLandscape(this, theme, variant: 'awakening', levelNumber: 0);

    final spawn = normalizedToWorld(
      level.config['spawnPosition'] as Map<String, dynamic>? ??
          {'x': 0.25, 'y': 0.62},
    );
    final goalPos = normalizedToWorld(
      level.config['goalPosition'] as Map<String, dynamic>? ??
          {'x': 0.78, 'y': 0.58},
    );

    _chispa = ChispaComponent(position: spawn, size: 30);
    walkChispa = _chispa;
    add(_chispa);

    _goal = LightMoteComponent(position: goalPos, radius: 38, isGoal: true);
    add(_goal);

    _guide = LevelScene.addGoalGuide(this, spawn, goalPos);
    _lightMask = LevelScene.addFogMask(this, theme, spawn, size);
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
    _lightMask?.lightPosition = _chispa.position;
    if (_goal.containsPoint(_chispa.position)) {
      walkCompleted = true;
      _goal.reached = true;
      _guide.enabled = false;
      onComplete(level);
    }
  }
}
