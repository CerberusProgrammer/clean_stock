// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SupplierAdapter extends TypeAdapter<Supplier> {
  @override
  final int typeId = 3;

  @override
  Supplier read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Supplier(
      id: fields[0] as int?,
      name: fields[1] as String,
      icon: fields[2] as String?,
      description: fields[3] as String?,
      address: fields[4] as String?,
      website: fields[5] as String?,
      contactEmail: fields[6] as String?,
      contactPhone: fields[7] as String?,
      country: fields[8] as String?,
      city: fields[9] as String?,
      status: fields[10] as bool,
      color: fields[11] as String?,
      createdAt: fields[12] as DateTime,
      updatedAt: fields[13] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Supplier obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.website)
      ..writeByte(6)
      ..write(obj.contactEmail)
      ..writeByte(7)
      ..write(obj.contactPhone)
      ..writeByte(8)
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.city)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.color)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SupplierAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
