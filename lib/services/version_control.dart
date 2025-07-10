import 'package:shared_preferences/shared_preferences.dart';
import 'activity_service.dart';

class VersionControl {
  static const _keyLastVersion = 'last_hive_update_version';

  static Future<void> checkAndUpdateHive({required int currentVersion}) async {
    final prefs = await SharedPreferences.getInstance();
    final lastVersion = prefs.getInt(_keyLastVersion) ?? 0;

    if (currentVersion > lastVersion) {
      // ✅ First-time: insert defaults
      if (lastVersion == 0) {
        await ActivityService().initializeDefaults();
      }

      if (lastVersion < 2) {
        await ActivityService().addNewActivityType('meditation', 5);
        await ActivityService().addNewActivityType('kisu_kotha_1', 3);
      }

      // Save new version
      await prefs.setInt(_keyLastVersion, currentVersion);
    }
  }
}
