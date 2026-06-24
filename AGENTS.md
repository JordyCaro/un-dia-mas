# Instrucciones para agentes de IA

Proyecto: **Un Día Más** — juego contemplativo Flutter + Flame (Enjoy Journey).

## Antes de codificar

1. Lee [`docs/CONTINUAR_DESARROLLO.md`](docs/CONTINUAR_DESARROLLO.md) — filosofía, convenciones, checklist.
2. Lee [`docs/ARQUITECTURA.md`](docs/ARQUITECTURA.md) si tocas estructura o mecánicas.
3. Para niveles nuevos: [`docs/AGREGAR_NIVEL.md`](docs/AGREGAR_NIVEL.md) + entrada en [`Enjoy_Journey_Master_Design_Document_v1.md`](Enjoy_Journey_Master_Design_Document_v1.md).
4. Para compilar/probar: [`docs/COMPILAR_Y_PROBAR.md`](docs/COMPILAR_Y_PROBAR.md).

## Reglas rápidas

- App en `un_dia_mas/`. Datos de niveles en `assets/data/levels/`. Orden en `lib/services/level_loader.dart` → `levelOrder`.
- Input en web va por `lib/features/game/game_screen.dart`, no por drag en Flame.
- Español, tono contemplativo, sin gamificación punitiva. Colombia para crisis v1.
- Cambios mínimos; no refactorizar sin pedido. No commit salvo que el usuario lo pida.
- Validar con `flutter analyze` (y build web si el cambio es grande).

## Estado

18 / 183 niveles (~10 %). Último: `ch1_l15`. Siguiente natural: `ch1_l16`.

## Índice completo

[`docs/README.md`](docs/README.md)
