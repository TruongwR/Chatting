// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_location.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationHeviAdapter extends TypeAdapter<LocationHevi> {
  @override
  final int typeId = 0;

  @override
  LocationHevi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationHevi(
      userName: fields[0] as String?,
      passWord: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocationHevi obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(5)
      ..write(obj.passWord);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationHeviAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
