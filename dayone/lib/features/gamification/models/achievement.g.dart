// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AchievementAdapter extends TypeAdapter<Achievement> {
  @override
  final int typeId = 3;

  @override
  Achievement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Achievement(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      iconName: fields[3] as String,
      xpReward: fields[4] as int,
      category: fields[5] as AchievementCategory,
      requiredValue: fields[6] as int,
      isHidden: fields[7] as bool? ?? false,
    );
  }

  @override
  void write(BinaryWriter writer, Achievement obj) {
    writer.writeByte(8);
    writer.writeByte(0);
    writer.write(obj.id);
    writer.writeByte(1);
    writer.write(obj.title);
    writer.writeByte(2);
    writer.write(obj.description);
    writer.writeByte(3);
    writer.write(obj.iconName);
    writer.writeByte(4);
    writer.write(obj.xpReward);
    writer.writeByte(5);
    writer.write(obj.category);
    writer.writeByte(6);
    writer.write(obj.requiredValue);
    writer.writeByte(7);
    writer.write(obj.isHidden);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AchievementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AchievementCategoryAdapter extends TypeAdapter<AchievementCategory> {
  @override
  final int typeId = 4;

  @override
  AchievementCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AchievementCategory.milestone;
      case 1:
        return AchievementCategory.streak;
      case 2:
        return AchievementCategory.challenge;
      case 3:
        return AchievementCategory.xp;
      default:
        return AchievementCategory.milestone;
    }
  }

  @override
  void write(BinaryWriter writer, AchievementCategory obj) {
    switch (obj) {
      case AchievementCategory.milestone:
        writer.writeByte(0);
        break;
      case AchievementCategory.streak:
        writer.writeByte(1);
        break;
      case AchievementCategory.challenge:
        writer.writeByte(2);
        break;
      case AchievementCategory.xp:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AchievementCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EarnedAchievementAdapter extends TypeAdapter<EarnedAchievement> {
  @override
  final int typeId = 5;

  @override
  EarnedAchievement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EarnedAchievement(
      achievementId: fields[0] as String,
      earnedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, EarnedAchievement obj) {
    writer.writeByte(2);
    writer.writeByte(0);
    writer.write(obj.achievementId);
    writer.writeByte(1);
    writer.write(obj.earnedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EarnedAchievementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
