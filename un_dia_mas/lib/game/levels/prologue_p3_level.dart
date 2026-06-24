import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:un_dia_mas/core/theme/world_themes.dart';
import 'package:un_dia_mas/game/components/chispa_component.dart';
import 'package:un_dia_mas/game/components/light_mote_component.dart';
import 'package:un_dia_mas/game/components/trail_path_component.dart';
import 'package:un_dia_mas/game/levels/level_scene.dart';
import 'package:un_dia_mas/game/levels/walk_movement.dart';
import 'package:un_dia_mas/models/level_definition.dart';
import 'package:un_dia_mas/game/components/goal_guide_component.dart';

typedef LevelCompleteCallback = void Function(LevelDefinition level);

class PrologueP3Level extends PositionComponent
    with HasGameReference<FlameGame>, WalkMovement {
  PrologueP3Level({required this.level, required this.onComplete});

  final LevelDefinition level;
  final LevelCompleteCallback onComplete;

  late ChispaComponent _chispa;
  late LightMoteComponent _goal;
  late TrailPathComponent _trail;
  late GoalGuideComponent _guide;

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
    LevelScene.addLandscape(this, theme, variant: 'first_trail', levelNumber: 0);

    _trail = TrailPathComponent();
    add(_trail);

    final spawn = normalizedToWorld({'x': 0.12, 'y': 0.72});
    final goalPos = normalizedToWorld(
      level.config['goalPosition'] as Map<String, dynamic>? ??
          {'x': 0.88, 'y': 0.65},
    );

    _chispa = ChispaComponent(position: spawn, size: 28);
    walkChispa = _chispa;
    add(_chispa);

    _goal = LightMoteComponent(position: goalPos, radius: 42, isGoal: true);
    add(_goal);

    _guide = LevelScene.addGoalGuide(this, spawn, goalPos);
    _trail.recordPosition(spawn);
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
    _trail.recordPosition(_chispa.position);
    if (_goal.containsPoint(_chispa.position)) {
      walkCompleted = true;
      _goal.reached = true;
      _guide.enabled = false;
      onComplete(level);
    }
  }
}
