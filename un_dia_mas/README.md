# Un Día Más (One More Day)

Juego contemplativo en Flutter + Flame. Camina como **La Luz** (La Chispa) y llega a mañana.

Aliado del ecosistema Enjoy. Idioma: **español**. Recursos de crisis: **Colombia** (v1).

## Requisitos

- Flutter SDK 3.16+ ([instalado en `C:\Repos\flutter`](C:\Repos\flutter) o en PATH)
- Chrome (para probar en web)
- Android Studio / Xcode (opcional, para móvil)

### Añadir Flutter al PATH (Windows)

```powershell
# Sesión actual
$env:Path = "C:\Repos\flutter\bin;" + $env:Path

# Permanente (PowerShell como admin, una vez)
[Environment]::SetEnvironmentVariable("Path", "C:\Repos\flutter\bin;" + [Environment]::GetEnvironmentVariable("Path", "User"), "User")
```

## Inicio rápido

```powershell
cd "c:\Repos\enjoy game\un_dia_mas"
flutter pub get
```

## Probar en la web

### Opción 1 — Modo desarrollo (recomendado)

Abre Chrome con hot reload:

```powershell
cd "c:\Repos\enjoy game\un_dia_mas"
flutter run -d chrome
```

- **Ratón:** arrastra para mover la chispa
- **P2 El Aliento:** mantén clic presionado para respirar
- La app se recarga al guardar cambios en el código

### Opción 2 — Build de producción local

Ya compilado en `build/web/`. Servir con cualquier servidor estático:

```powershell
cd "c:\Repos\enjoy game\un_dia_mas"
flutter build web --release
cd build\web
python -m http.server 8080
```

Abre en el navegador: **http://localhost:8080**

### Opción 3 — Edge

```powershell
flutter run -d edge
```

## Probar en Windows (escritorio)

```powershell
flutter run -d windows
```

## Probar en Android

Con emulador o dispositivo conectado:

```powershell
flutter run -d android
```

## MVP actual — ~10 % del juego (18 / 183 niveles)

| Bloque | Niveles | Contenido |
|--------|---------|-----------|
| Prólogo | P1–P3 | Parpadeo, Aliento, Primer Paso |
| Cap. 1 La Niebla | 1–15 | Niebla, senderos, espejo, linterna, piedras |

Mecánicas: `walk_to_light`, `breathe`, `trail_walk`, `fog_walk`, `invisible_path`, `three_paths`, `mirror_pond`, `lantern_boost`.

Progresión automática con botón **Siguiente paso** al completar cada nivel.

## Estructura

```
lib/
  core/theme/       # Colores, WorldTheme por capítulo
  game/
    components/     # Chispa, fondo, motas, sendero, niebla
    levels/         # P1, P2, P3, Niebla
  features/         # Inicio, juego, ajustes, crisis Colombia
  models/           # LevelDefinition
  services/         # Niveles JSON, guardado local
assets/data/levels/ # prólogo.json, chapter_01.json
build/web/          # Build web listo para desplegar
```

## La Chispa (código, sin sprites)

Dibujada en `ChispaComponent`: núcleo cálido, corona, halo pulsante, chispas orbitales y estela al moverse.

## Disclaimer

Un Día Más es entretenimiento y bienestar emocional general. No sustituye atención profesional de salud mental.
