import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/extensions.dart';
import 'package:un_dia_mas/game/components/chispa_component.dart';
import 'package:un_dia_mas/game/un_dia_mas_game.dart';

/// Movimiento compartido — lee entrada desde Flutter (ratón, tacto, teclado).
mixin WalkMovement on PositionComponent, HasGameReference<FlameGame> {
  ChispaComponent get walkChispa;
  bool get walkCompleted;
  double get walkMoveSpeed => 180;

  UnDiaMasGame get walkGame => game as UnDiaMasGame;

  void applyMovementInput(double dt) {
    if (walkCompleted) return;

    final pan = walkGame.consumePanDelta();
    final keys = walkGame.consumeKeyDirection();

    var direction = Vector2.zero();
    if (pan.length > 0) {
      direction = pan.normalized();
    } else if (keys.length > 0) {
      direction = keys.normalized();
    }

    if (direction.length > 0) {
      final speed = keys.length > 0 ? walkMoveSpeed : walkMoveSpeed * 0.85;
      final movement = direction * speed * dt;
      walkChispa.position += movement;
      walkChispa.setVelocity(movement / dt);
      clampChispaToBounds();
    } else {
      walkChispa.setVelocity(Vector2.zero());
    }
  }

  void clampChispaToBounds() {
    final half = walkChispa.size.x / 2;
    walkChispa.position.x =
        walkChispa.position.x.clamp(half, size.x - half);
    walkChispa.position.y =
        walkChispa.position.y.clamp(half, size.y - half);
  }

  Vector2 normalizedToWorld(Map<String, dynamic> norm) {
    final nx = (norm['x'] as num).toDouble();
    final ny = (norm['y'] as num).toDouble();
    return Vector2(nx * size.x, ny * size.y);
  }
}
