import 'package:clean_stock/models/ccategory.dart';
import 'package:clean_stock/models/manufacturer.dart';
import 'package:clean_stock/models/supplier.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final String id;
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
    this.supplier,
    this.icon,
    this.image,
    required this.status,
    required this.price,
    required this.quantity,
    this.quantityMin,
    this.quantityMax,
    this.color,
    this.category,
    required this.createdAt,
    required this.updatedAt,
    this.manufacturerId,
    this.supplierId,
    this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        barcode: json['barcode'],
        weight: json['weight']?.toDouble(),
        dimension: json['dimension'],
        expirationDate: json['expiration_date'] != null
            ? DateTime.parse(json['expiration_date'])
            : null,
        location: json['location'],
        manufacturer: json['manufacturer'] != null
            ? Manufacturer.fromJson(json['manufacturer'])
            : null,
        manufacturerId: json['manufacturer_id'],
        supplier: json['supplier'] != null
            ? Supplier.fromJson(json['supplier'])
            : null,
        supplierId: json['supplier_id'],
        icon: json['icon'],
        image: json['image'],
        status: json['status'],
        price: json['price'],
        quantity: json['quantity'],
        quantityMin: json['quantity_min'],
        quantityMax: json['quantity_max'],
        color: json['color'],
        category: json['category'] != null
            ? Category.fromJson(json['category'])
            : null,
        categoryId: json['category_id'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  factory Product.fromSQL(Map<String, dynamic> sql) => Product(
        id: sql['id'],
        name: sql['name'],
        description: sql['description'],
        barcode: sql['barcode'],
        weight: sql['weight']?.toDouble(),
        dimension: sql['dimension'],
        expirationDate: sql['expiration_date'] != null
            ? DateTime.parse(sql['expiration_date'])
            : null,
        location: sql['location'],
        manufacturerId: sql['manufacturer_id'],
        supplierId: sql['supplier_id'],
        icon: sql['icon'],
        image: sql['image'],
        status: sql['status'] == 1,
        price: sql['price'],
        quantity: sql['quantity'],
        quantityMin: sql['quantity_min'],
        quantityMax: sql['quantity_max'],
        color: sql['color'],
        categoryId: sql['category_id'],
        createdAt: DateTime.parse(sql['created_at']),
        updatedAt: DateTime.parse(sql['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'barcode': barcode,
        'weight': weight,
        'dimension': dimension,
        'expiration_date': expirationDate?.toIso8601String(),
        'location': location,
        'manufacturer': manufacturer?.toJson(),
        'supplier': supplier?.toJson(),
        'icon': icon,
        'image': image,
        'status': status,
        'price': price,
        'quantity': quantity,
        'quantity_min': quantityMin,
        'quantity_max': quantityMax,
        'color': color,
        'category': category?.toJson(),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  Map<String, dynamic> toJsonForSQL() => {
        'id': id,
        'name': name,
        'description': description,
        'barcode': barcode,
        'weight': weight,
        'dimension': dimension,
        'expiration_date': expirationDate?.toIso8601String(),
        'location': location,
        'manufacturer_id': manufacturer?.id,
        'supplier_id': supplier?.id,
        'icon': icon,
        'image': image,
        'status': status ? 1 : 0,
        'price': price,
        'quantity': quantity,
        'quantity_min': quantityMin,
        'quantity_max': quantityMax,
        'color': color,
        'category_id': category?.id,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  copyWith({
    String? id,
    String? name,
    String? description,
    String? barcode,
    double? weight,
    String? dimension,
    DateTime? expirationDate,
    String? location,
    Manufacturer? manufacturer,
    int? manufacturerId,
    Supplier? supplier,
    int? supplierId,
    String? icon,
    String? image,
    bool? status,
    double? price,
    int? quantity,
    int? quantityMin,
    int? quantityMax,
    String? color,
    Category? category,
    int? categoryId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      barcode: barcode ?? this.barcode,
      weight: weight ?? this.weight,
      dimension: dimension ?? this.dimension,
      expirationDate: expirationDate ?? this.expirationDate,
      location: location ?? this.location,
      manufacturer: manufacturer ?? this.manufacturer,
      manufacturerId: manufacturerId ?? this.manufacturerId,
      supplier: supplier ?? this.supplier,
      supplierId: supplierId ?? this.supplierId,
      icon: icon ?? this.icon,
      image: image ?? this.image,
      status: status ?? this.status,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      quantityMin: quantityMin ?? this.quantityMin,
      quantityMax: quantityMax ?? this.quantityMax,
      color: color ?? this.color,
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, barcode: $barcode, weight: $weight, dimension: $dimension, expirationDate: ${expirationDate?.toIso8601String()}, location: $location, manufacturer: $manufacturer, manufacturer_id: $manufacturerId, supplier: $supplier, supplier_id: $supplierId icon: $icon, image: $image, status: $status, price: $price, quantity: $quantity, quantityMin: $quantityMin, quantityMax: $quantityMax, color: $color, category: $category, category_id: $category, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
