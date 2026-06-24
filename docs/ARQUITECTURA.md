# Arquitectura — Un Día Más

Visión técnica del proyecto para orientar cambios sin leer todo el código.

---

## 1. Stack

```
┌─────────────────────────────────────────┐
│  Flutter (Material UI)                  │
│  features/home, settings, game_screen   │
├─────────────────────────────────────────┤
│  Flame (FlameGame + Components)         │
│  game/un_dia_mas_game.dart              │
├─────────────────────────────────────────┤
│  Datos JSON + SharedPreferences         │
│  assets/data/levels, SaveService        │
└─────────────────────────────────────────┘
```

| Capa | Paquetes |
|------|----------|
| UI | `flutter`, `google_fonts` |
| Juego | `flame` ^1.18 |
| Estado / persistencia | `flutter_riverpod`, `shared_preferences` |
| Utilidades | `url_launcher` (crisis) |

---

## 2. Flujo de la aplicación

```
main.dart
  └── UnDiaMasApp (app.dart)
        └── HomeScreen
              ├── [Continuar] → GameScreen(level)
              ├── [Ajustes] → SettingsScreen
              └── [Crisis] → CrisisResourcesScreen

GameScreen
  ├── HUD Flutter (frase, hints, Descansar) — IgnorePointer parcial
  ├── GestureDetector / KeyboardListener → UnDiaMasGame
  └── GameWidget(UnDiaMasGame)
        └── switch(mechanic) → LevelComponent
              └── onComplete → SaveService + diálogo siguiente nivel
```

---

## 3. Capas del proyecto

### `lib/core/theme/`

| Archivo | Rol |
|---------|-----|
| `app_colors.dart` | Paleta global, colores de La Chispa |
| `app_theme.dart` | `ThemeData` oscuro Material |
| `world_themes.dart` | `WorldTheme` por capítulo: niebla, colores, `lightRadius`, `fogDensity` |

### `lib/models/`

- `LevelDefinition` — un nivel desde JSON.
- `ChapterDefinition` — metadatos de capítulo + lista de niveles.

### `lib/services/`

| Servicio | Rol |
|----------|-----|
| `LevelLoader` | Carga JSON, `levelOrder`, siguiente nivel, total jugable |
| `SaveService` | `current_level_id`, `completed_levels` en SharedPreferences |

### `lib/features/`

Pantallas Flutter puras. La más compleja es **`game_screen.dart`**:

- Monta `GameWidget` con el nivel actual.
- Captura pan/teclado y lo envía al `FlameGame`.
- Overlay de completado y navegación al siguiente nivel.

### `lib/game/`

| Archivo | Rol |
|---------|-----|
| `un_dia_mas_game.dart` | `FlameGame` raíz; enruta mecánica → nivel |
| `levels/*_level.dart` | Escenas por mecánica |
| `levels/walk_movement.dart` | Mixin: velocidad, input, coords normalizadas |
| `levels/level_scene.dart` | Helpers: paisaje, niebla, guía |
| `components/*` | Renderizado procedural |

---

## 4. Componentes Flame principales

```
WorldLandscapeBackground   ← fondo procedural (colinas, props)
ChispaComponent            ← jugador (La Luz)
LightMoteComponent         ← meta / motas
GoalGuideComponent         ← flecha hacia la meta
LightMaskOverlay           ← niebla con agujero de luz
PathRevealComponent        ← sendero invisible_path
TrailPathComponent         ← estela P3
```

**Prioridades:** paisaje bajo, sendero ~10, guía 50, niebla 100.

---

## 5. Sistema de niveles

### Fuente de verdad

1. **Diseño narrativo:** GDD (183 entradas).
2. **Datos runtime:** `assets/data/levels/*.json`.
3. **Orden jugable:** `LevelLoader.levelOrder` (lista explícita de IDs).

El JSON del capítulo define `worldTheme` aplicado a todos sus niveles.

### Enrutamiento de mecánicas

`UnDiaMasGame._loadLevel()` hace `switch (level.mechanic)`:

- Mecánicas del prólogo → clases dedicadas (tutorial).
- Niebla y variantes → `FogWalkLevel` genérico parametrizado por `config`.

Fallback por `level.id` si la mecánica es desconocida pero el id es `ch1_*`.

### Config por nivel (`config` en JSON)

| Clave | Tipo | Uso |
|-------|------|-----|
| `fogDensity` | double | Opacidad niebla |
| `lightRadius` | double | Radio de luz base |
| `landscapeVariant` | string | Props en paisaje |
| `spawnPosition` | {x,y} | Inicio normalizado |
| `goalPosition` | {x,y} | Meta normalizado |
| `pathRevealRadius` | double | `invisible_path` |
| `pondPosition` / `pondClearRadius` | | `mirror_pond` |
| `pickupPosition` / `lightRadiusBoost` | | `lantern_boost` |

---

## 6. Input (web y desktop)

```
Usuario arrastra / pulsa tecla
    → GameScreen (Flutter)
    → UnDiaMasGame.addPanDelta / setKeyDirection
    → WalkMovement.applyMovementInput (en update del nivel)
    → ChispaComponent.position
```

**Por qué:** en web, widgets Flutter encima del canvas capturan eventos antes que Flame.

---

## 7. Persistencia

| Clave SharedPreferences | Contenido |
|-------------------------|-----------|
| `current_level_id` | Último nivel activo / siguiente |
| `completed_levels` | Lista de IDs completados |

`markLevelCompleted()` avanza automáticamente al siguiente en `levelOrder`.

---

## 8. Assets

```
assets/data/levels/
  prologue.json      chapter: 0, worldTheme: prologue
  chapter_01.json    chapter: 1, worldTheme: fog
```

Declarados en `pubspec.yaml` bajo `flutter.assets`.

No hay imágenes de gameplay en v1; iconos en `web/icons/` y launchers nativos.

---

## 9. Añadir un capítulo nuevo (resumen)

1. Crear `assets/data/levels/chapter_02.json`.
2. Añadir asset en `pubspec.yaml` si la ruta cambia (hoy es carpeta completa).
3. Extender `WorldTheme` si el tema visual es nuevo.
4. Implementar `loadChapter(2)` en `LevelLoader`.
5. Añadir IDs a `levelOrder`.
6. Variantes de paisaje en `world_landscape_background.dart`.

Detalle paso a paso para un solo nivel: [AGREGAR_NIVEL.md](AGREGAR_NIVEL.md).

---

## 10. Diagrama de dependencias (simplificado)

```
features/game/game_screen.dart
    → game/un_dia_mas_game.dart
        → game/levels/*_level.dart
            → game/components/*
            → core/theme/world_themes.dart
            → models/level_definition.dart
    → services/save_service.dart
    → services/level_loader.dart
        → assets/data/levels/*.json
```

---

## 11. Extensiones futuras (previstas en GDD, no en código)

- Audio por capítulo
- Modo contemplación (sin HUD / sin presión)
- Backend Enjoy / cuentas
- Localización EN
- Deep links `undiomas://`

Al implementarlas, actualizar este documento y `CONTINUAR_DESARROLLO.md`.
