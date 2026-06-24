import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:un_dia_mas/models/level_definition.dart';

class LevelLoader {
  static const _prologuePath = 'assets/data/levels/prologue.json';
  static const _chapter01Path = 'assets/data/levels/chapter_01.json';

  static const levelOrder = [
    'prologue_p1',
    'prologue_p2',
    'prologue_p3',
    'ch1_l01',
    'ch1_l02',
    'ch1_l03',
    'ch1_l04',
    'ch1_l05',
    'ch1_l06',
    'ch1_l07',
    'ch1_l08',
    'ch1_l09',
    'ch1_l10',
    'ch1_l11',
    'ch1_l12',
    'ch1_l13',
    'ch1_l14',
    'ch1_l15',
  ];

  /// 18 de ~183 niveles planificados ≈ 10 % del juego.
  static const int plannedTotalLevels = 183;

  Future<ChapterDefinition> loadPrologue() async {
    final raw = await rootBundle.loadString(_prologuePath);
    return ChapterDefinition.fromJson(
      jsonDecode(raw) as Map<String, dynamic>,
    );
  }

  Future<ChapterDefinition> loadChapter(int chapter) async {
    if (chapter == 0) return loadPrologue();
    if (chapter == 1) {
      final raw = await rootBundle.loadString(_chapter01Path);
      return ChapterDefinition.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    }
    throw UnimplementedError('Capítulo $chapter aún no disponible.');
  }

  Future<List<LevelDefinition>> loadAllAvailableLevels() async {
    final prologue = await loadPrologue();
    final chapter1 = await loadChapter(1);
    return [...prologue.levels, ...chapter1.levels];
  }

  Future<LevelDefinition> loadLevelById(String levelId) async {
    final all = await loadAllAvailableLevels();
    for (final level in all) {
      if (level.id == levelId) return level;
    }
    throw ArgumentError('Nivel no encontrado: $levelId');
  }

  Future<String?> getNextLevelId(String currentLevelId) async {
    final index = levelOrder.indexOf(currentLevelId);
    if (index < 0 || index >= levelOrder.length - 1) return null;
    return levelOrder[index + 1];
  }

  Future<String> getFirstPlayableLevelId() async => levelOrder.first;

  Future<String> resolveContinueLevelId(Set<String> completed) async {
    for (final id in levelOrder) {
      if (!completed.contains(id)) return id;
    }
    return levelOrder.last;
  }

  int get totalPlayableLevels => levelOrder.length;
}
