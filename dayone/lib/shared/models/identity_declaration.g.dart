// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_declaration.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IdentityDeclarationAdapter extends TypeAdapter<IdentityDeclaration> {
  @override
  final int typeId = 0;

  @override
  IdentityDeclaration read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IdentityDeclaration(
      id: fields[0] as String,
      userId: fields[1] as String,
      declaration: fields[2] as String,
      visionPerson: fields[3] as String,
      dailyActions: (fields[4] as List).cast<String>(),
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, IdentityDeclaration obj) {
    writer.writeByte(7);
    writer.writeByte(0);
    writer.write(obj.id);
    writer.writeByte(1);
    writer.write(obj.userId);
    writer.writeByte(2);
    writer.write(obj.declaration);
    writer.writeByte(3);
    writer.write(obj.visionPerson);
    writer.writeByte(4);
    writer.write(obj.dailyActions);
    writer.writeByte(5);
    writer.write(obj.createdAt);
    writer.writeByte(6);
    writer.write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdentityDeclarationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
