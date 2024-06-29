import 'package:clean_stock/models/category.model.hive.dart';
import 'package:hive/hive.dart';
import 'package:clean_stock/models/manufacturer.model.hive.dart';
import 'package:clean_stock/models/supplier.model.hive.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final String barcode;

  @HiveField(4)
  final double? weight;

  @HiveField(5)
  final String? dimension;

  @HiveField(6)
  final DateTime? expirationDate;

  @HiveField(7)
  final String? location;

  @HiveField(8)
  final Manufacturer? manufacturer;

  @HiveField(9)
  final int? manufacturerId;

  @HiveField(10)
  final Supplier? supplier;

  @HiveField(11)
  final int? supplierId;

  @HiveField(12)
  final String? icon;

  @HiveField(13)
  final String? image;

  @HiveField(14)
  final bool status;

  @HiveField(15)
  final double price;

  @HiveField(16)
  final int quantity;

  @HiveField(17)
  final int? quantityMin;

  @HiveField(18)
  final int? quantityMax;

  @HiveField(19)
  final String? color;

  @HiveField(20)
  final Category? category;

  @HiveField(21)
  final int? categoryId;

  @HiveField(22)
  final DateTime createdAt;

  @HiveField(23)
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    this.description,
    required this.barcode,
    this.weight,
    this.dimension,
    this.expirationDate,
    this.location,
    this.manufacturer,
    this.manufacturerId,
    this.supplier,
    this.supplierId,
    this.icon,
    this.image,
    required this.status,
    required this.price,
    required this.quantity,
    this.quantityMin,
    this.quantityMax,
    this.color,
    this.category,
    this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });
}
