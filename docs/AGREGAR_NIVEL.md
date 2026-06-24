# Cómo añadir un nivel

Guía práctica para incorporar un nivel nuevo al juego. Ejemplo: **Cap. 1, nivel 16** (`ch1_l16`).

---

## Paso 0 — Consultar el GDD

En `Enjoy_Journey_Master_Design_Document_v1.md`, busca el capítulo y anota:

- Nombre, historia, frase
- Mecánica prevista
- Duración objetivo (~5–8 min → `targetDurationSeconds` 300–480)

Si la mecánica del GDD no existe aún, valora reutilizar la más cercana (`fog_walk`, `invisible_path`, etc.) antes de crear una nueva.

---

## Paso 1 — Entrada en JSON

Edita `un_dia_mas/assets/data/levels/chapter_01.json` (o el capítulo correspondiente).

Plantilla:

```json
{
  "id": "ch1_l16",
  "chapter": 1,
  "levelNumber": 16,
  "code": "16",
  "name": "Nombre del nivel",
  "story": "Texto breve de contexto.",
  "mechanic": "fog_walk",
  "memoryId": "memory_ch1_algo_unico",
  "phrase": "Frase al completar.",
  "targetDurationSeconds": 420,
  "config": {
    "fogDensity": 0.82,
    "lightRadius": 95,
    "landscapeVariant": "default",
    "spawnPosition": { "x": 0.1, "y": 0.8 },
    "goalPosition": { "x": 0.88, "y": 0.74 }
  }
}
```

### Campos obligatorios

| Campo | Notas |
|-------|-------|
| `id` | Único en todo el juego |
| `mechanic` | Debe estar soportada en `un_dia_mas_game.dart` |
| `memoryId` | Identificador del recuerdo (futuro coleccionable) |
| `phrase` | Se muestra al completar |

### Ajustar dificultad atmosférica

- Más niebla → subir `fogDensity` (0.0–1.0)
- Menos visión → bajar `lightRadius`
- Camino más largo → separar `spawnPosition` y `goalPosition`

---

## Paso 2 — Registrar en el orden jugable

En `lib/services/level_loader.dart`, añade el id al final de `levelOrder`:

```dart
static const levelOrder = [
  // ...
  'ch1_l15',
  'ch1_l16',  // ← nuevo
];
```

Sin este paso el nivel existe en JSON pero **no aparece en la progresión**.

---

## Paso 3 — Mecánica (si es existente)

Si usas `fog_walk`, `invisible_path`, `mirror_pond`, etc. **no hace falta código nuevo** — solo JSON.

Verifica que el `switch` en `un_dia_mas_game.dart` incluya tu `mechanic`. Si no:

```dart
'fog_walk' || 'invisible_path' || ... || 'tu_mecanica' =>
  FogWalkLevel(level: level, onComplete: callback),
```

---

## Paso 4 — Mecánica nueva (solo si hace falta)

1. Implementar lógica en `fog_walk_level.dart` (preferido) o nueva clase en `game/levels/`.
2. Registrar en `un_dia_mas_game.dart`.
3. Añadir hints en `game_screen.dart`:

```dart
// _hintForMechanic
'tu_mecanica' => 'Texto de ayuda para el jugador',

// _objectiveLabel (opcional)
'tu_mecanica' => 'Objetivo: ...',
```

4. Documentar la mecánica en `docs/CONTINUAR_DESARROLLO.md` (tabla de mecánicas).

---

## Paso 5 — Variante visual (opcional)

Si necesitas un prop nuevo (árbol, puente, piedra, etc.):

1. Elige un nombre: `landscapeVariant`: `"mi_variante"`.
2. En `world_landscape_background.dart`, añade un `else if` en el método que dibuja props.
3. Implementa un helper `_drawMiCosa(Canvas canvas, Offset pos)`.

Variantes existentes de referencia:

`default`, `broken_compass`, `three_paths`, `note_tree`, `stone_circle`, `beacon_hill`, `bridge_gap`, `rest_chair`, `clock_post`, `stone_cairn`, `whisper_mist`, `mirror_pond`, `lantern_post`, `carved_stones`.

---

## Paso 6 — Probar

```bash
cd un_dia_mas
flutter pub get
flutter run -d chrome
```

1. Completa el nivel anterior o borra progreso en Ajustes / storage del navegador.
2. Juega hasta el nuevo nivel o usa continuar si ya completaste los anteriores.
3. Verifica: movimiento, niebla, meta, frase, botón siguiente.

```bash
flutter analyze
```

---

## Paso 7 — Actualizar documentación de estado

Si el nivel aumenta el total jugable, actualiza:

- `docs/README.md` — conteo y último nivel
- `README.md` raíz — porcentaje aproximado
- Opcional: tabla en `un_dia_mas/README.md`

Fórmula: `niveles / 183` ≈ % del juego.

---

## Ejemplo rápido: `invisible_path`

```json
"mechanic": "invisible_path",
"config": {
  "fogDensity": 0.85,
  "lightRadius": 90,
  "pathRevealRadius": 110,
  "landscapeVariant": "default",
  "spawnPosition": { "x": 0.1, "y": 0.8 },
  "goalPosition": { "x": 0.9, "y": 0.72 }
}
```

---

## Ejemplo rápido: nuevo capítulo

1. Crear `assets/data/levels/chapter_02.json` con estructura:

```json
{
  "chapter": 2,
  "chapterName": "Nombre del mundo",
  "worldTheme": "nombre_tema",
  "levels": [ ... ]
}
```

2. En `world_themes.dart`, definir `WorldTheme` para `"nombre_tema"`.
3. En `level_loader.dart`:

```dart
static const _chapter02Path = 'assets/data/levels/chapter_02.json';

// en loadChapter:
if (chapter == 2) { ... }
```

4. Concatenar niveles en `loadAllAvailableLevels()` y extender `levelOrder`.

---

## Errores comunes

| Síntoma | Causa |
|---------|-------|
| Nivel no aparece | Falta en `levelOrder` |
| Crash al cargar | JSON inválido o `id` duplicado |
| Pantalla vacía | `mechanic` no registrada en `un_dia_mas_game.dart` |
| Meta inalcanzable | `goalPosition` fuera de pantalla o detrás de obstáculo visual |
| Sin frase al terminar | `phrase` null o vacío en JSON |
