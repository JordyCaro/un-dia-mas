import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:un_dia_mas/core/theme/app_colors.dart';
import 'package:un_dia_mas/game/un_dia_mas_game.dart';
import 'package:un_dia_mas/models/level_definition.dart';
import 'package:un_dia_mas/services/level_loader.dart';
import 'package:un_dia_mas/services/save_service.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.level});

  final LevelDefinition level;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _saveService = SaveService();
  final _levelLoader = LevelLoader();
  final _focusNode = FocusNode();
  final _pressedKeys = <LogicalKeyboardKey>{};

  late UnDiaMasGame _game;
  bool _showComplete = false;
  String? _phrase;
  String? _nextLevelId;

  @override
  void initState() {
    super.initState();
    _game = UnDiaMasGame(
      level: widget.level,
      onLevelComplete: _onLevelComplete,
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _onLevelComplete(LevelDefinition level) async {
    await _saveService.markLevelCompleted(level.id);
    final next = await _levelLoader.getNextLevelId(level.id);
    if (!mounted) return;
    setState(() {
      _showComplete = true;
      _phrase = level.phrase;
      _nextLevelId = next;
    });
  }

  void _rest() => Navigator.of(context).pop();

  Future<void> _playNextLevel() async {
    if (_nextLevelId == null) return;
    final next = await _levelLoader.loadLevelById(_nextLevelId!);
    if (!mounted) return;
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => GameScreen(level: next)),
    );
  }

  bool get _usesBreathing => widget.level.mechanic == 'breathe';

  bool get _usesMovement => !_usesBreathing && !_showComplete;

  String _hintForMechanic(String mechanic) {
    return switch (mechanic) {
      'breathe' => 'Mantén el clic presionado hasta llenar el aliento',
      'trail_walk' => 'Sigue la flecha dorada. El sendero se dibuja detrás de ti',
      'fog_walk' => 'Explora la niebla — busca la luz tenue',
      'invisible_path' => 'El sendero aparece bajo tus pasos',
      'three_paths' => 'Cualquier camino es válido. Sigue la luz',
      'mirror_pond' => 'Acércate al charco — refleja un cielo despejado',
      'lantern_boost' => 'Encuentra la linterna para ampliar tu luz',
      _ => 'Sigue la flecha hacia la mota de luz',
    };
  }

  Widget _controlHints() {
    if (_usesBreathing) {
      return _hintChip(Icons.touch_app_outlined, 'Mantén clic');
    }
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 6,
      children: [
        _hintChip(Icons.mouse_outlined, 'Arrastra'),
        _hintChip(Icons.keyboard_outlined, 'WASD / flechas'),
      ],
    );
  }

  Widget _hintChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: ChispaColors.halo.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ChispaColors.halo.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: ChispaColors.halo.withValues(alpha: 0.8)),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: ChispaColors.halo.withValues(alpha: 0.85),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  String get _objectiveLabel {
    return switch (widget.level.mechanic) {
      'breathe' => 'Objetivo: calma tu aliento',
      'fog_walk' => 'Objetivo: encuentra el recuerdo',
      'mirror_pond' => 'Objetivo: mira el espejo del charco',
      'lantern_boost' => 'Objetivo: enciende la linterna',
      _ => 'Objetivo: llega a la luz',
    };
  }

  void _updateKeyDirection() {
    var x = 0.0;
    var y = 0.0;
    if (_isKey(LogicalKeyboardKey.arrowLeft) ||
        _isKey(LogicalKeyboardKey.keyA)) {
      x -= 1;
    }
    if (_isKey(LogicalKeyboardKey.arrowRight) ||
        _isKey(LogicalKeyboardKey.keyD)) {
      x += 1;
    }
    if (_isKey(LogicalKeyboardKey.arrowUp) ||
        _isKey(LogicalKeyboardKey.keyW)) {
      y -= 1;
    }
    if (_isKey(LogicalKeyboardKey.arrowDown) ||
        _isKey(LogicalKeyboardKey.keyS)) {
      y += 1;
    }
    _game.setKeyDirection(Vector2(x, y));
  }

  bool _isKey(LogicalKeyboardKey key) => _pressedKeys.contains(key);

  KeyEventResult _handleKey(FocusNode node, KeyEvent event) {
    if (_showComplete) return KeyEventResult.ignored;
    if (event is KeyDownEvent) {
      _pressedKeys.add(event.logicalKey);
    } else if (event is KeyUpEvent) {
      _pressedKeys.remove(event.logicalKey);
    }
    _updateKeyDirection();
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WorldColors.prologueVoid,
      body: Focus(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: _handleKey,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Capa de juego — recibe ratón, tacto y clic
            Listener(
              onPointerDown: _usesBreathing && !_showComplete
                  ? (_) => _game.setBreathingHeld(true)
                  : null,
              onPointerUp: _usesBreathing && !_showComplete
                  ? (_) => _game.setBreathingHeld(false)
                  : null,
              onPointerCancel: _usesBreathing && !_showComplete
                  ? (_) => _game.setBreathingHeld(false)
                  : null,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanUpdate: _usesMovement
                    ? (details) => _game.addPanDelta(details.delta)
                    : null,
                onPanEnd: _usesMovement ? (_) => _game.clearPanDelta() : null,
                onPanCancel: _usesMovement ? () => _game.clearPanDelta() : null,
                child: GameWidget(game: _game),
              ),
            ),
            // HUD — no bloquea clics al juego (excepto botón Descansar)
            if (!_showComplete) ...[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: IgnorePointer(
                          child: Text(
                            widget.level.name,
                            style: const TextStyle(
                              color: AppColors.secondaryText,
                              fontSize: 14,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: _rest,
                        child: const Text('Descansar'),
                      ),
                    ],
                  ),
                ),
              ),
              if (_usesBreathing)
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
                    child: IgnorePointer(
                      child: _BreathingProgressBar(game: _game),
                    ),
                  ),
                ),
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    child: IgnorePointer(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _objectiveLabel,
                            style: TextStyle(
                              color: ChispaColors.halo.withValues(alpha: 0.75),
                              fontSize: 12,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          _controlHints(),
                          const SizedBox(height: 14),
                          Text(
                            widget.level.story,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                                  AppColors.primaryText.withValues(alpha: 0.7),
                              fontSize: 15,
                              height: 1.5,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _hintForMechanic(widget.level.mechanic),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ChispaColors.halo.withValues(alpha: 0.5),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
            if (_showComplete) _buildCompleteOverlay(),
          ],
        ),
      ),
    );
  }

  Widget _buildCompleteOverlay() {
    return Container(
      color: Colors.black.withValues(alpha: 0.75),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.light_mode_outlined,
                size: 48,
                color: ChispaColors.halo.withValues(alpha: 0.9),
              ),
              const SizedBox(height: 24),
              if (_phrase != null) ...[
                Text(
                  _phrase!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w300,
                        height: 1.4,
                      ),
                ),
                const SizedBox(height: 16),
              ] else
                Text(
                  'Todavía estás aquí.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              if (widget.level.memoryId != null) ...[
                const SizedBox(height: 12),
                Text(
                  'Recuerdo desbloqueado',
                  style: TextStyle(
                    color: ChispaColors.halo.withValues(alpha: 0.7),
                    fontSize: 13,
                  ),
                ),
              ],
              const SizedBox(height: 32),
              if (_nextLevelId != null)
                ElevatedButton(
                  onPressed: _playNextLevel,
                  child: const Text('Siguiente paso'),
                ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: _rest,
                child: const Text('Descansar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BreathingProgressBar extends StatefulWidget {
  const _BreathingProgressBar({required this.game});

  final UnDiaMasGame game;

  @override
  State<_BreathingProgressBar> createState() => _BreathingProgressBarState();
}

class _BreathingProgressBarState extends State<_BreathingProgressBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _tick());
  }

  void _tick() {
    if (!mounted) return;
    setState(() {});
    Future.delayed(const Duration(milliseconds: 50), _tick);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: widget.game.breatheProgress,
            minHeight: 4,
            backgroundColor: Colors.white12,
            color: ChispaColors.halo,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Aliento: ${(widget.game.breatheProgress * 100).round()}%',
          style: TextStyle(
            color: AppColors.secondaryText.withValues(alpha: 0.8),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
