import 'package:shared_preferences/shared_preferences.dart';
import 'user_emotion_enum.dart'; // path where you define the enum

class EmotionStorage {
  static const _key = 'selected_emotion';

  static Future<void> saveEmotion(UserEmotion emotion) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, emotion.name);
  }

  static Future<UserEmotion?> loadEmotion() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_key);
    if (name == null) return null;
    return UserEmotion.values.firstWhere(
          (e) => e.name == name,
      orElse: () => UserEmotion.sad,
    );
  }
}
