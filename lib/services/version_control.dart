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

      // 🚀 Future additions go below
      // if (lastVersion < 2) {
      //   await ActivityService().addNewActivityType('quiz', 8);
      // }

      // Save new version
      await prefs.setInt(_keyLastVersion, currentVersion);
    }
  }
}
