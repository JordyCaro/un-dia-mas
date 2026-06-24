# Continuar el desarrollo — Guía de alineación

Documento para **desarrolladores humanos** y **agentes de IA** que retomen el proyecto en otro equipo o máquina. Objetivo: mantener coherencia con el diseño, el código existente y la filosofía del producto.

---

## 1. Principios del producto (no negociables)

Leer el GDD (`Enjoy_Journey_Master_Design_Document_v1.md`), al menos:

- **Sección 1 — Visión:** no es un «juego de salud mental»; es sobre **seguir adelante**.
- **Sección 27 — Manifiesto Enjoy:** tono realista, sin promesas vacías, sin gamificación agresiva.
- **Sección 28 — Modo contemplación:** respetar pausas, ritmo lento, sin presión.

### Tono y copy

- **Idioma:** español en v1.
- **Frases de nivel:** cortas, poéticas, sin moralina. Ejemplo del GDD: *«Un paso sigue siendo un paso.»*
- **Crisis:** recursos reales de Colombia (Línea 106, 123, etc.) — no inventar números.

### Lo que NO hacer

- Añadir vidas, game over punitivo, timers agresivos o monetización invasiva.
- Convertir mecánicas en puzzles difíciles; la dificultad es emocional/atmósfera, no cognitiva.
- Romper el minimalismo visual: La Chispa se dibuja con código (sin sprites PNG por ahora).
- Cambiar nombres de marca: app = **Un Día Más**, personaje = **La Chispa / La Luz**.

---

## 2. Estado actual del código

| Métrica | Valor |
|---------|-------|
| Niveles jugables | 18 (`levelOrder` en `level_loader.dart`) |
| Total planificado | 183 |
| Capítulos en código | Prólogo (0) + Cap. 1 La Niebla (1) |
| Siguiente trabajo natural | `ch1_l16` en adelante, luego Cap. 2 |

### Mecánicas implementadas

| `mechanic` | Clase | Uso |
|------------|-------|-----|
| `walk_to_light` | `PrologueP1Level` | Deslizar hacia la luz |
| `breathe` | `PrologueP2Level` | Mantener para respirar |
| `trail_walk` | `PrologueP3Level` | Caminar; sendero detrás |
| `fog_walk` | `FogWalkLevel` | Niebla + meta |
| `invisible_path` | `FogWalkLevel` | Sendero bajo los pies |
| `three_paths` | `FogWalkLevel` | Varias rutas válidas |
| `mirror_pond` | `FogWalkLevel` | Charco amplía luz al acercarse |
| `lantern_boost` | `FogWalkLevel` | Pickup permanente de luz |

Nuevas mecánicas: preferir extender `FogWalkLevel` o `LevelScene` antes de crear clases nuevas, salvo que el GDD exija lógica muy distinta (ej. puzzles del Cap. 3).

---

## 3. Convenciones de código

### Estilo

- Seguir el estilo existente en cada archivo (imports, naming, comentarios mínimos).
- Dart 3.x, `flutter_lints`. Ejecutar `flutter analyze` antes de terminar.
- **Cambios pequeños y enfocados** — no refactorizar archivos no relacionados.
- Comentarios solo para lógica no obvia (coordenadas normalizadas, blend modes, etc.).

### Estructura de carpetas

```
un_dia_mas/lib/
  core/theme/       # Colores, WorldTheme
  features/         # Pantallas Flutter (home, game, settings)
  game/
    components/     # Chispa, paisaje, niebla, motas
    levels/         # Escenas Flame por mecánica
  models/           # LevelDefinition
  services/         # LevelLoader, SaveService
```

- **UI Flutter** → `features/`
- **Lógica de juego Flame** → `game/`
- **Datos** → `assets/data/levels/*.json`
- **No mezclar** widgets Material dentro de componentes Flame salvo overlay en `game_screen.dart`.

### Input (importante)

El input **no** va en componentes Flame con `DragCallbacks` en web. Va en:

- `lib/features/game/game_screen.dart` — `GestureDetector`, `Listener`, teclado
- `lib/game/un_dia_mas_game.dart` — `addPanDelta()`, `setKeyDirection()`
- `lib/game/levels/walk_movement.dart` — consume input y mueve la chispa

Si añades una mecánica con interacción, sigue este patrón.

### Coordenadas de nivel

En JSON, posiciones usan **coordenadas normalizadas** 0.0–1.0:

```json
"spawnPosition": { "x": 0.1, "y": 0.8 },
"goalPosition": { "x": 0.88, "y": 0.74 }
```

Se convierten a píxeles en `WalkMovement.normalizedToWorld()`.

### IDs de nivel

| Capítulo | Patrón | Ejemplo |
|----------|--------|---------|
| Prólogo | `prologue_p{n}` | `prologue_p1` |
| Capítulo N | `ch{n}_l{nn}` | `ch1_l16` (dos dígitos) |

Siempre registrar el ID en `LevelLoader.levelOrder`.

### Temas visuales

`WorldTheme` en `core/theme/world_themes.dart`. Cap. 1 usa `worldTheme: "fog"` en el JSON del capítulo.

Variantes de paisaje: string en `config.landscapeVariant` → switch en `world_landscape_background.dart`.

---

## 4. Checklist antes de implementar

- [ ] Leí la entrada del nivel en el GDD (tabla capítulo correspondiente).
- [ ] El `mechanic` existe o documenté por qué creo uno nuevo.
- [ ] Añadí el nivel al JSON correcto (`prologue.json` o `chapter_XX.json`).
- [ ] Añadí el `id` a `levelOrder` en `level_loader.dart`.
- [ ] Si hay mecánica nueva: actualicé `un_dia_mas_game.dart` (switch) y `game_screen.dart` (hints).
- [ ] Si hay variante visual nueva: añadí caso en `world_landscape_background.dart`.
- [ ] Probé en Chrome: movimiento, completar nivel, siguiente paso.
- [ ] `flutter analyze` sin errores.

---

## 5. Checklist para agentes de IA

Si eres un agente (Cursor, Copilot, etc.):

1. **Lee primero:** este archivo + `ARQUITECTURA.md` + entrada del GDD del nivel/tarea.
2. **No inventes** narrativa que contradiga el GDD; si falta detalle, usa el tono de frases existentes en `chapter_01.json`.
3. **No commits** salvo que el usuario lo pida explícitamente.
4. **No expandas scope:** un PR = un capítulo parcial o una mecánica, no reescribir todo.
5. **Prueba:** ejecuta `flutter analyze` y, si es posible, `flutter build web --release`.
6. **Documenta** cambios de convención en este folder `docs/`, no solo en comentarios de código.
7. **Respeto al input web:** cualquier cambio en Flame debe mantener el puente Flutter en `game_screen.dart`.

### Archivos que casi siempre tocarás al añadir contenido

1. `assets/data/levels/chapter_XX.json`
2. `lib/services/level_loader.dart`
3. `lib/game/levels/fog_walk_level.dart` (o nivel dedicado)
4. `lib/game/un_dia_mas_game.dart`
5. `lib/features/game/game_screen.dart`
6. `lib/game/components/world_landscape_background.dart`

### Archivos que rara vez debes tocar

- `pubspec.yaml` (solo si nuevas dependencias o carpetas de assets)
- Pantallas de crisis Colombia (salvo nuevos recursos por país)
- `SaveService` (estable; solo si cambia el modelo de progreso)

---

## 6. Roadmap sugerido (orden de trabajo)

1. **Completar Cap. 1** — niveles 16–20 del GDD (`chapter_01.json`).
2. **Cap. 2** — nuevo JSON `chapter_02.json`, tema en `world_themes.dart`, cargar en `LevelLoader`.
3. **Audio** — música ambiente por `worldTheme` (aún no implementado).
4. **Modo contemplación** — toggle en ajustes (GDD §28).
5. **Integración Enjoy** — deep links, API (GDD §23).
6. **Localización EN** — después de cerrar ES v1.

Priorizar **más niveles con mecánicas existentes** antes de sistemas nuevos.

---

## 7. Decisiones ya tomadas (no reabrir sin motivo)

| Tema | Decisión |
|------|----------|
| Motor | Flutter + Flame (no Unity/Godot) |
| Sprites Chispa | Código procedural v1 ( `chispa_component.dart` ) |
| Estado | `shared_preferences` (sin backend aún) |
| Estado global UI | Riverpod (`ProviderScope` en `app.dart`; uso mínimo por ahora) |
| Plataforma prioritaria | Web para iteración rápida; móvil nativo en paralelo |
| País crisis v1 | Colombia |

---

## 8. Cómo validar que «va bien»

- La experiencia se siente **lenta y segura**, no frustrante.
- Completar un nivel muestra la **frase** del JSON y permite continuar sin bloqueos.
- La niebla y la luz son legibles en pantallas pequeñas y web.
- No hay regresiones de input en web.

---

## 9. Contacto y referencias

- **Repo:** https://github.com/JordyCaro/un-dia-mas
- **Compilar:** [COMPILAR_Y_PROBAR.md](COMPILAR_Y_PROBAR.md)
- **Añadir nivel:** [AGREGAR_NIVEL.md](AGREGAR_NIVEL.md)
- **GDD:** `Enjoy_Journey_Master_Design_Document_v1.md`
