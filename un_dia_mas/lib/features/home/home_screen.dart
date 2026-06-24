import 'package:flutter/material.dart';
import 'package:un_dia_mas/core/theme/app_colors.dart';
import 'package:un_dia_mas/features/game/game_screen.dart';
import 'package:un_dia_mas/features/settings/settings_screen.dart';
import 'package:un_dia_mas/services/level_loader.dart';
import 'package:un_dia_mas/services/save_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _levelLoader = LevelLoader();
  final _saveService = SaveService();
  bool _loading = true;
  String? _continueLevelId;
  bool _hasProgress = false;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final completed = await _saveService.getCompletedLevels();
    final continueId = await _levelLoader.resolveContinueLevelId(completed);
    setState(() {
      _continueLevelId = continueId;
      _hasProgress = completed.isNotEmpty;
      _loading = false;
    });
  }

  Future<void> _startGame({required String levelId}) async {
    final level = await _levelLoader.loadLevelById(levelId);
    if (!mounted) return;
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GameScreen(level: level),
      ),
    );
    await _loadProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                'Un Día Más',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.2,
                      color: ChispaColors.halo,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'La Luz',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.secondaryText,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 4,
                    ),
              ),
              const SizedBox(height: 48),
              Text(
                'No necesitas llegar al final.\nSolo llega a mañana.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.secondaryText,
                      height: 1.6,
                    ),
              ),
              const Spacer(),
              if (_loading)
                const Center(child: CircularProgressIndicator())
              else ...[
                ElevatedButton(
                  onPressed: () => _startGame(
                    levelId: _continueLevelId ?? 'prologue_p1',
                  ),
                  child: Text(
                    _hasProgress
                        ? 'Continuar el camino'
                        : 'Encender la chispa',
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () async {
                    await _saveService.clearProgress();
                    if (!mounted) return;
                    await _startGame(levelId: 'prologue_p1');
                  },
                  child: const Text(
                    'Empezar de nuevo',
                    style: TextStyle(color: AppColors.secondaryText),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const SettingsScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.settings_outlined, size: 18),
                label: const Text('Ajustes'),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
