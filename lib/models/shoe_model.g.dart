// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoeModelAdapter extends TypeAdapter<ShoeModel> {
  @override
  final int typeId = 1;

  @override
  ShoeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoeModel(
      name: fields[0] as String,
      price: fields[1] as String,
      desc: fields[2] as String,
      image: fields[3] as String,
      id: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ShoeModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
