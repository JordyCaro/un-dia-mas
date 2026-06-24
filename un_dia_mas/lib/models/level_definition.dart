class LevelDefinition {
  const LevelDefinition({
    required this.id,
    required this.chapter,
    required this.levelNumber,
    required this.code,
    required this.name,
    required this.story,
    required this.mechanic,
    required this.memoryId,
    required this.phrase,
    required this.targetDurationSeconds,
    required this.config,
    required this.worldTheme,
  });

  final String id;
  final int chapter;
  final int levelNumber;
  final String code;
  final String name;
  final String story;
  final String mechanic;
  final String? memoryId;
  final String? phrase;
  final int targetDurationSeconds;
  final Map<String, dynamic> config;
  final String worldTheme;

  factory LevelDefinition.fromJson(
    Map<String, dynamic> json, {
    required String worldTheme,
  }) {
    return LevelDefinition(
      id: json['id'] as String,
      chapter: json['chapter'] as int,
      levelNumber: json['levelNumber'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      story: json['story'] as String,
      mechanic: json['mechanic'] as String,
      memoryId: json['memoryId'] as String?,
      phrase: json['phrase'] as String?,
      targetDurationSeconds: json['targetDurationSeconds'] as int? ?? 300,
      config: Map<String, dynamic>.from(json['config'] as Map? ?? {}),
      worldTheme: worldTheme,
    );
  }
}

class ChapterDefinition {
  const ChapterDefinition({
    required this.chapter,
    required this.chapterName,
    required this.worldTheme,
    required this.levels,
  });

  final int chapter;
  final String chapterName;
  final String worldTheme;
  final List<LevelDefinition> levels;

  factory ChapterDefinition.fromJson(Map<String, dynamic> json) {
    final theme = json['worldTheme'] as String;
    final levelsJson = json['levels'] as List<dynamic>;
    return ChapterDefinition(
      chapter: json['chapter'] as int,
      chapterName: json['chapterName'] as String,
      worldTheme: theme,
      levels: levelsJson
          .map((e) => LevelDefinition.fromJson(
                e as Map<String, dynamic>,
                worldTheme: theme,
              ))
          .toList(),
    );
  }
}
