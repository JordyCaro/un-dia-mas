import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:un_dia_mas/game/levels/fog_walk_level.dart';
import 'package:un_dia_mas/game/levels/prologue_p1_level.dart';
import 'package:un_dia_mas/game/levels/prologue_p2_level.dart';
import 'package:un_dia_mas/game/levels/prologue_p3_level.dart';
import 'package:un_dia_mas/models/level_definition.dart';

class UnDiaMasGame extends FlameGame {
  UnDiaMasGame({
    required this.level,
    required this.onLevelComplete,
  });

  final LevelDefinition level;
  final void Function(LevelDefinition level) onLevelComplete;

  bool breathingHeld = false;
  double breatheProgress = 0;

  Vector2 _panDelta = Vector2.zero();
  Vector2 _keyDirection = Vector2.zero();

  void setBreathingHeld(bool value) => breathingHeld = value;

  void addPanDelta(Offset delta) {
    _panDelta += Vector2(delta.dx, delta.dy);
  }

  void clearPanDelta() => _panDelta = Vector2.zero();

  Vector2 consumePanDelta() {
    final delta = _panDelta.clone();
    _panDelta = Vector2.zero();
    return delta;
  }

  void setKeyDirection(Vector2 direction) => _keyDirection = direction;

  Vector2 consumeKeyDirection() {
    final dir = _keyDirection.clone();
    return dir;
  }

  @override
  Color backgroundColor() => const Color(0xFF050508);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _loadLevel();
  }

  void _loadLevel() {
    final callback = onLevelComplete;
    final levelComponent = switch (level.mechanic) {
      'walk_to_light' => PrologueP1Level(level: level, onComplete: callback),
      'breathe' => PrologueP2Level(level: level, onComplete: callback),
      'trail_walk' => PrologueP3Level(level: level, onComplete: callback),
      'fog_walk' || 'invisible_path' || 'three_paths' ||
      'mirror_pond' || 'lantern_boost' =>
        FogWalkLevel(level: level, onComplete: callback),
      _ => switch (level.id) {
          'prologue_p1' => PrologueP1Level(level: level, onComplete: callback),
          'prologue_p2' => PrologueP2Level(level: level, onComplete: callback),
          'prologue_p3' => PrologueP3Level(level: level, onComplete: callback),
          String id when id.startsWith('ch1_') =>
            FogWalkLevel(level: level, onComplete: callback),
          _ => PrologueP1Level(level: level, onComplete: callback),
        },
    };
    add(levelComponent);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    for (final child in children.whereType<PositionComponent>()) {
      if (child is PrologueP1Level ||
          child is PrologueP2Level ||
          child is PrologueP3Level ||
          child is FogWalkLevel) {
        child.size = size;
      }
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    for (final p2 in children.whereType<PrologueP2Level>()) {
      breatheProgress = p2.breatheProgress;
    }
  }
}
