// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_progress.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityProgressAdapter extends TypeAdapter<ActivityProgress> {
  @override
  final int typeId = 0;

  @override
  ActivityProgress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivityProgress(
      type: fields[0] as String,
      activityId: fields[1] as String,
      completed: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ActivityProgress obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.activityId)
      ..writeByte(2)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityProgressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
