# Compilar y probar — Un Día Más

Guía completa para que cualquier desarrollador o persona sin contexto previo pueda ejecutar la app localmente.

---

## 1. Qué vas a ejecutar

- **Proyecto:** app Flutter en la carpeta `un_dia_mas/`
- **Motor de juego:** [Flame](https://flame-engine.org/)
- **Plataforma más fácil para probar:** navegador (Chrome o Edge)
- **También soportado:** Windows, Android, iOS, macOS, Linux (requiere SDKs adicionales)

---

## 2. Requisitos

### Obligatorios (todas las plataformas)

| Herramienta | Versión mínima | Verificar |
|-------------|----------------|-----------|
| [Flutter SDK](https://docs.flutter.dev/get-started/install) | 3.16+ | `flutter --version` |
| Git | cualquiera reciente | `git --version` |

### Recomendados para desarrollo web

| Herramienta | Uso |
|-------------|-----|
| Google Chrome o Microsoft Edge | `flutter run -d chrome` / `-d edge` |

### Opcionales por plataforma

| Plataforma | Requisito extra |
|------------|-----------------|
| **Windows desktop** | Visual Studio 2022 con workload «Desktop development with C++» |
| **Android** | Android Studio + SDK + emulador o dispositivo USB |
| **iOS** | macOS + Xcode (solo en Mac) |

---

## 3. Clonar el repositorio

```bash
git clone https://github.com/JordyCaro/un-dia-mas.git
cd un-dia-mas/un_dia_mas
```

> La app vive en `un_dia_mas/`. El GDD y la documentación están en la raíz del repo.

---

## 4. Instalar Flutter

### Windows (PowerShell)

1. Descarga el SDK desde https://docs.flutter.dev/get-started/install/windows  
   O clónalo: `git clone https://github.com/flutter/flutter.git -b stable C:\src\flutter`
2. Añade Flutter al PATH de la sesión:

```powershell
$env:Path = "C:\src\flutter\bin;" + $env:Path
```

3. Permanente (una vez, usuario actual):

```powershell
[Environment]::SetEnvironmentVariable(
  "Path",
  "C:\src\flutter\bin;" + [Environment]::GetEnvironmentVariable("Path", "User"),
  "User"
)
```

### macOS / Linux

Sigue la guía oficial: https://docs.flutter.dev/get-started/install

### Verificar instalación

```bash
flutter doctor
```

Resuelve los ítems marcados con `✗` antes de continuar. Para web solo necesitas que aparezca **Chrome** o un navegador compatible.

---

## 5. Preparar el proyecto

Desde la carpeta `un_dia_mas/`:

```bash
flutter pub get
```

Esto descarga dependencias (`flame`, `riverpod`, `shared_preferences`, etc.).

### Análisis estático (opcional pero recomendado)

```bash
flutter analyze
```

No debe haber errores (`error`). Los avisos `info` de estilo son aceptables.

---

## 6. Probar en el navegador (recomendado)

### Modo desarrollo — hot reload

```bash
flutter run -d chrome
```

O con Edge:

```bash
flutter run -d edge
```

**Controles en web:**

| Acción | Control |
|--------|---------|
| Mover La Chispa | Arrastrar con el ratón / trackpad |
| Mover La Chispa | Teclas WASD o flechas |
| Respirar (nivel P2) | Mantener clic presionado |
| Descansar (pausa) | Botón «Descansar» en el HUD |
| Siguiente nivel | Botón al completar el nivel |

La app se recarga al guardar cambios en el código (hot reload: `r` en la terminal; hot restart: `R`).

### Listar dispositivos disponibles

```bash
flutter devices
```

### Servidor web sin abrir navegador automáticamente

```bash
flutter run -d web-server --web-port=8080
```

Abre manualmente la URL que muestra la terminal (ej. `http://localhost:8080`).

---

## 7. Build de producción (web)

```bash
flutter build web --release
```

Salida en: `un_dia_mas/build/web/`

### Servir el build localmente

**Opción A — Flutter:**

```bash
flutter run -d web-server --release
```

**Opción B — Python 3:**

```bash
cd build/web
python -m http.server 8080
```

Abre http://localhost:8080

**Opción C — Node (si tienes `npx`):**

```bash
cd build/web
npx --yes serve -p 8080
```

> No subas `build/` a Git; está en `.gitignore`. Cada dev genera su propio build.

---

## 8. Probar en Windows (escritorio)

Requisito: Visual Studio con C++ desktop.

```bash
flutter run -d windows
```

Build release:

```bash
flutter build windows --release
```

Ejecutable en `build/windows/x64/runner/Release/`.

---

## 9. Probar en Android

1. Abre Android Studio y crea/inicia un emulador, o conecta un dispositivo con depuración USB.
2. Verifica que Flutter lo detecta:

```bash
flutter devices
```

3. Ejecuta:

```bash
flutter run -d android
```

---

## 10. Probar en iOS (solo macOS)

```bash
flutter run -d ios
```

Requiere Xcode y certificados de desarrollo para dispositivo físico.

---

## 11. Flujo de prueba manual sugerido

Usa esta checklist después de cambios importantes:

1. **Inicio** — La pantalla principal carga sin errores.
2. **Continuar / Empezar** — Abre el nivel correcto según progreso guardado.
3. **Prólogo P1** — Arrastrar hacia la mota de luz funciona.
4. **Prólogo P2** — Mantener clic llena la barra de aliento.
5. **Prólogo P3** — El sendero se dibuja al caminar.
6. **Cap. 1 (ej. ch1_l01)** — Niebla, flecha guía, llegar a la meta.
7. **ch1_l13 / ch1_l14** — Mecánicas `mirror_pond` y `lantern_boost`.
8. **Completar nivel** — Aparece frase y botón «Siguiente paso».
9. **Ajustes** — Recursos de crisis Colombia abren enlaces/teléfonos.
10. **Reiniciar progreso** — Vuelve al primer nivel.

### Saltar a un nivel concreto (desarrollo)

El progreso se guarda en `SharedPreferences` (web: almacenamiento del navegador). Para reiniciar:

- Usa la opción en Ajustes si está disponible, o
- Borra datos del sitio en el navegador (DevTools → Application → Clear storage), o
- En móvil: desinstala y reinstala la app.

---

## 12. Problemas frecuentes

| Problema | Solución |
|----------|----------|
| `flutter: command not found` | Flutter no está en PATH; ver sección 4 |
| `No devices found` | Instala Chrome o ejecuta `flutter create .` en `un_dia_mas/` si faltan carpetas de plataforma |
| El ratón no mueve la chispa | Bug conocido resuelto: el input va por Flutter (`game_screen.dart`), no por Flame directo. Actualiza a la última versión del repo |
| Pantalla negra en web | Abre la consola del navegador (F12). Ejecuta `flutter clean && flutter pub get && flutter run -d chrome` |
| Assets no cargan | Verifica que `pubspec.yaml` incluya `assets/data/levels/` y ejecuta hot restart (`R`) |
| Build web falla | `flutter doctor -v` y revisa que Dart SDK sea >= 3.2 |

### Limpieza completa

```bash
flutter clean
flutter pub get
flutter run -d chrome
```

---

## 13. Variables y rutas útiles

| Concepto | Valor |
|----------|-------|
| Carpeta de la app | `un_dia_mas/` |
| Entry point | `lib/main.dart` |
| Niveles (datos) | `assets/data/levels/*.json` |
| Orden de niveles | `lib/services/level_loader.dart` → `levelOrder` |
| Build web release | `build/web/` |

---

## 14. CI / automatización (referencia)

Comandos mínimos para un pipeline:

```bash
cd un_dia_mas
flutter pub get
flutter analyze
flutter test
flutter build web --release
```

---

## 15. Más información

- Convenciones de desarrollo: [CONTINUAR_DESARROLLO.md](CONTINUAR_DESARROLLO.md)
- Arquitectura: [ARQUITECTURA.md](ARQUITECTURA.md)
- Añadir niveles: [AGREGAR_NIVEL.md](AGREGAR_NIVEL.md)
