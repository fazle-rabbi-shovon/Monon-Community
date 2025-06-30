import 'package:hive/hive.dart';

part 'activity_progress.g.dart';

@HiveType(typeId: 0)
class ActivityProgress extends HiveObject {
  @HiveField(0)
  String type; // e.g., 'video', 'audio', 'written'

  @HiveField(1)
  String activityId; // e.g., 'video-0', 'audio-3'

  @HiveField(2)
  bool completed;

  ActivityProgress({
    required this.type,
    required this.activityId,
    this.completed = false,
  });
}
