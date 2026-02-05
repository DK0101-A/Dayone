// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileAdapter extends TypeAdapter<UserProfile> {
  @override
  final int typeId = 2;

  @override
  UserProfile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfile(
      id: fields[0] as String,
      currentLanguage: fields[1] as String,
      currentLevel: fields[2] as int,
      totalXp: fields[3] as int,
      streakDays: fields[4] as int,
      achievements: (fields[5] as List).cast<String>(),
      createdAt: fields[6] as DateTime,
      lastActiveDate: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfile obj) {
    writer.writeByte(8);
    writer.writeByte(0);
    writer.write(obj.id);
    writer.writeByte(1);
    writer.write(obj.currentLanguage);
    writer.writeByte(2);
    writer.write(obj.currentLevel);
    writer.writeByte(3);
    writer.write(obj.totalXp);
    writer.writeByte(4);
    writer.write(obj.streakDays);
    writer.writeByte(5);
    writer.write(obj.achievements);
    writer.writeByte(6);
    writer.write(obj.createdAt);
    writer.writeByte(7);
    writer.write(obj.lastActiveDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
