import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:un_dia_mas/core/theme/world_themes.dart';
import 'package:un_dia_mas/game/components/darkness_background.dart';
import 'package:un_dia_mas/game/components/light_mask_overlay.dart';
import 'package:un_dia_mas/models/level_definition.dart';

typedef LevelCompleteCallback = void Function(LevelDefinition level);

/// Capas compartidas por todos los niveles para diseño congruente.
abstract class BaseLevel extends PositionComponent with HasGameReference<FlameGame> {
  BaseLevel({required this.level, required this.onComplete});

  final LevelDefinition level;
  final LevelCompleteCallback onComplete;

  late WorldTheme worldTheme;
  LightMaskOverlay? lightMask;

  @override
  Future<void> onLoad() async {
    size = game.size;
    position = Vector2.zero();
    worldTheme = WorldTheme.fromId(level.worldTheme);
    add(DarknessBackground(theme: worldTheme));
    await setupLevel();
    if (worldTheme.fogDensity > 0) {
      lightMask = LightMaskOverlay(
        theme: worldTheme,
        lightPosition: Vector2.zero(),
      )..size = size;
      add(lightMask!);
    }
  }

  Future<void> setupLevel();

  void completeLevel() => onComplete(level);
}
