// lib/model/user_emotion_enum.dart

enum UserEmotion {
  anxious,
  scared,
  angry,
  sad,
  annoyed,
  happy,
}

extension UserEmotionExtension on UserEmotion {
  /// Returns the Bangla label for each emotion
  String get label {
    switch (this) {
      case UserEmotion.anxious:
        return 'দুশ্চিন্তা';
      case UserEmotion.scared:
        return 'ভয়';
      case UserEmotion.angry:
        return 'রাগ';
      case UserEmotion.sad:
        return 'দুঃখ';
      case UserEmotion.annoyed:
        return 'বিরক্তি';
      case UserEmotion.happy:
        return 'আনন্দ ';
    }
  }

  /// Returns the enum from a Bangla label
  static UserEmotion? fromLabel(String label) {
    try {
      return UserEmotion.values.firstWhere((e) => e.label == label);
    } catch (e) {
      return null;
    }
  }
}
