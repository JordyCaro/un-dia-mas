# Un Día Más (One More Day)

Juego contemplativo en Flutter + Flame. Camina como **La Luz** (La Chispa) y llega a mañana.

Aliado del ecosistema Enjoy. Idioma: **español**. Recursos de crisis: **Colombia** (v1).

## Documentación del proyecto

La documentación completa está en la **raíz del repositorio**:

| Guía | Enlace |
|------|--------|
| Compilar y probar (esta app) | [`../docs/COMPILAR_Y_PROBAR.md`](../docs/COMPILAR_Y_PROBAR.md) |
| Continuar desarrollo | [`../docs/CONTINUAR_DESARROLLO.md`](../docs/CONTINUAR_DESARROLLO.md) |
| Arquitectura | [`../docs/ARQUITECTURA.md`](../docs/ARQUITECTURA.md) |
| Añadir nivel | [`../docs/AGREGAR_NIVEL.md`](../docs/AGREGAR_NIVEL.md) |
| Índice | [`../docs/README.md`](../docs/README.md) |

## Inicio rápido

```bash
flutter pub get
flutter run -d chrome
```

Ver [**Compilar y probar**](../docs/COMPILAR_Y_PROBAR.md) para requisitos, otras plataformas y solución de problemas.

## MVP actual — ~10 % del juego (18 / 183 niveles)

| Bloque | Niveles | Contenido |
|--------|---------|-----------|
| Prólogo | P1–P3 | Parpadeo, Aliento, Primer Paso |
| Cap. 1 La Niebla | 1–15 | Niebla, senderos, espejo, linterna, piedras |

Mecánicas: `walk_to_light`, `breathe`, `trail_walk`, `fog_walk`, `invisible_path`, `three_paths`, `mirror_pond`, `lantern_boost`.

## Estructura de `lib/`

```
lib/
  core/theme/       # Colores, WorldTheme por capítulo
  game/
    components/     # Chispa, fondo, motas, sendero, niebla
    levels/         # P1, P2, P3, FogWalkLevel
  features/         # Inicio, juego, ajustes, crisis Colombia
  models/           # LevelDefinition
  services/         # Niveles JSON, guardado local
assets/data/levels/ # prólogo.json, chapter_01.json
```

## La Chispa (código, sin sprites)

Dibujada en `ChispaComponent`: núcleo cálido, corona, halo pulsante, tentáculos y estela al moverse.

## Disclaimer

Un Día Más es entretenimiento y bienestar emocional general. No sustituye atención profesional de salud mental.
