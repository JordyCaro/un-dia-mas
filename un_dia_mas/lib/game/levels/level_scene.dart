import 'package:flame/components.dart';
import 'package:un_dia_mas/core/theme/world_themes.dart';
import 'package:un_dia_mas/game/components/goal_guide_component.dart';
import 'package:un_dia_mas/game/components/light_mask_overlay.dart';
import 'package:un_dia_mas/game/components/world_landscape_background.dart';

class LevelScene {
  static WorldLandscapeBackground addLandscape(
    PositionComponent parent,
    WorldTheme theme, {
    String variant = 'default',
    int levelNumber = 0,
  }) {
    final landscape = WorldLandscapeBackground(
      theme: theme,
      variant: variant,
      levelNumber: levelNumber,
    );
    parent.add(landscape);
    return landscape;
  }

  static LightMaskOverlay? addFogMask(
    PositionComponent parent,
    WorldTheme theme,
    Vector2 lightPosition,
    Vector2 size,
  ) {
    if (theme.fogDensity <= 0) return null;
    final mask = LightMaskOverlay(theme: theme, lightPosition: lightPosition)
      ..size = size;
    parent.add(mask);
    return mask;
  }

  static GoalGuideComponent addGoalGuide(
    PositionComponent parent,
    Vector2 chispaPos,
    Vector2 goalPos, {
    bool enabled = true,
  }) {
    final guide = GoalGuideComponent(
      chispaPosition: chispaPos,
      goalPosition: goalPos,
      enabled: enabled,
    )..priority = 50;
    parent.add(guide);
    return guide;
  }
}
