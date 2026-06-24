import 'package:shared_preferences/shared_preferences.dart';
import 'package:un_dia_mas/services/level_loader.dart';

class SaveService {
  static const _currentLevelKey = 'current_level_id';
  static const _completedKey = 'completed_levels';

  Future<String?> getCurrentLevelId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_currentLevelKey);
  }

  Future<void> setCurrentLevelId(String levelId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentLevelKey, levelId);
  }

  Future<Set<String>> getCompletedLevels() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_completedKey)?.toSet() ?? {};
  }

  Future<void> markLevelCompleted(String levelId) async {
    final prefs = await SharedPreferences.getInstance();
    final completed = await getCompletedLevels();
    completed.add(levelId);
    await prefs.setStringList(_completedKey, completed.toList());

    final loader = LevelLoader();
    final next = await loader.getNextLevelId(levelId);
    await setCurrentLevelId(next ?? levelId);
  }

  Future<void> clearProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentLevelKey);
    await prefs.remove(_completedKey);
  }
}
