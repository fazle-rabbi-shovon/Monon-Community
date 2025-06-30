import 'package:hive/hive.dart';

import '../model/activity_progress.dart';


class ActivityService {
  final String boxName = 'activity_progress';

  Future<Box<ActivityProgress>> _getBox() async {
    return Hive.box<ActivityProgress>(boxName);
  }

  /// First-time setup: adds 'video', 'audio', 'written'
  Future<void> initializeDefaults() async {
    final box = await _getBox();
    if (box.isEmpty) {
      final Map<String, int> activityCounts = {
        'buddhimotta1': 6,
        'buddhimotta2': 6,
        'kisu_kotha': 18,
        'amar_kaaj': 12,
      };

      for (final entry in activityCounts.entries) {
        for (int i = 0; i < entry.value; i++) {
          final key = '${entry.key}-$i';
          await box.put(key, ActivityProgress(
            type: entry.key,
            activityId: key,
            completed: false,
          ));
        }
      }
    }
  }

  /// Mark one item as complete
  Future<void> markCompleted(String type, int index) async {
    final box = await _getBox();
    final key = '$type-$index';
    final item = box.get(key);
    if (item != null) {
      item.completed = true;
      await item.save();
    }
  }

  /// Check if one item is complete
  Future<bool> isItemCompleted(String type, int index) async {
    final box = await _getBox();
    final key = '$type-$index';
    final item = box.get(key);
    return item?.completed ?? false;
  }

  /// Check if all items of a type are completed
  Future<bool> isTypeCompleted(String type) async {
    final box = await _getBox();
    final items = box.values.where((e) => e.type == type);
    if (items.isEmpty) return false;
    return items.every((e) => e.completed);
  }

  /// Check if the 5th activity should be unlocked
  Future<bool> isFifthActivityUnlocked() async {
    final types = ['buddhimotta1', 'buddhimotta2','kisu_kotha', 'amar_kaaj'];
    for (final type in types) {
      if (!await isTypeCompleted(type)) return false;
    }
    return true;
  }

  /// Returns % of completed items in a type (0.0 to 1.0)
  Future<double> getTypeCompletionPercentage(String type) async {
    final box = await _getBox();
    final items = box.values.where((e) => e.type == type).toList();
    if (items.isEmpty) return 0.0;

    final completedCount = items.where((e) => e.completed).length;
    return completedCount / items.length;
  }

  /// Get combined completion percentage of buddhimotta1 and buddhimotta2
  Future<double> getBuddhimottaCompletionPercentage() async {
    final box = await _getBox();

    final items = box.values.where((e) =>
    e.type == 'buddhimotta1' || e.type == 'buddhimotta2'
    ).toList();

    if (items.isEmpty) return 0.0;

    final completed = items.where((e) => e.completed).length;
    return completed / items.length;
  }

  /// Returns overall % of completed items across all types (0.0 to 1.0)
  Future<double> getTotalCompletionPercentage() async {
    final box = await _getBox();
    final items = box.values.toList();
    if (items.isEmpty) return 0.0;

    final completedCount = items.where((e) => e.completed).length;
    return completedCount / items.length;
  }

  /// Add a new type later (e.g., 'quiz')
  Future<void> addNewActivityType(String type, int count) async {
    final box = await _getBox();
    for (int i = 0; i < count; i++) {
      final key = '$type-$i';
      if (!box.containsKey(key)) {
        await box.put(key, ActivityProgress(
          type: type,
          activityId: key,
          completed: false,
        ));
      }
    }
  }

  /// Check if a type already exists
  Future<bool> hasActivityType(String type) async {
    final box = await _getBox();
    return box.values.any((e) => e.type == type);
  }

  /// Reset all progress (optional)
  Future<void> resetAllProgress() async {
    final box = await _getBox();
    for (var item in box.values) {
      item.completed = false;
      await item.save();
    }
  }
}
