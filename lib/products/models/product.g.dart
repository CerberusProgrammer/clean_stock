// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String?,
      barcode: fields[3] as String,
      weight: fields[4] as double?,
      dimension: fields[5] as String?,
      expirationDate: fields[6] as DateTime?,
      location: fields[7] as String?,
      manufacturer: fields[8] as Manufacturer?,
      supplier: fields[10] as Supplier?,
      icon: fields[12] as String?,
      image: fields[13] as String?,
      status: fields[14] as bool,
      price: fields[15] as double,
      quantity: fields[16] as int,
      quantityMin: fields[17] as int?,
      quantityMax: fields[18] as int?,
      color: fields[19] as String?,
      category: fields[20] as Category?,
      createdAt: fields[22] as DateTime,
      updatedAt: fields[23] as DateTime,
      manufacturerId: fields[9] as int?,
      supplierId: fields[11] as int?,
      categoryId: fields[21] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.barcode)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.dimension)
      ..writeByte(6)
      ..write(obj.expirationDate)
      ..writeByte(7)
      ..write(obj.location)
      ..writeByte(8)
      ..write(obj.manufacturer)
      ..writeByte(9)
      ..write(obj.manufacturerId)
      ..writeByte(10)
      ..write(obj.supplier)
      ..writeByte(11)
      ..write(obj.supplierId)
      ..writeByte(12)
      ..write(obj.icon)
      ..writeByte(13)
      ..write(obj.image)
      ..writeByte(14)
      ..write(obj.status)
      ..writeByte(15)
      ..write(obj.price)
      ..writeByte(16)
      ..write(obj.quantity)
      ..writeByte(17)
      ..write(obj.quantityMin)
      ..writeByte(18)
      ..write(obj.quantityMax)
      ..writeByte(19)
      ..write(obj.color)
      ..writeByte(20)
      ..write(obj.category)
      ..writeByte(21)
      ..write(obj.categoryId)
      ..writeByte(22)
      ..write(obj.createdAt)
      ..writeByte(23)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
