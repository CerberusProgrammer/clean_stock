import 'package:clean_stock/models/Category.dart';
import 'package:clean_stock/models/manufacturer.dart';
import 'package:clean_stock/models/supplier.dart';

class Product {
  final int id;
  final String name;
  final String? description;
  final String barcode;
  final double? weight;
  final String? dimension;
  final DateTime? expirationDate;
  final String? location;
  final Manufacturer? manufacturer;
  final Supplier? supplier;
  final String? icon;
  final String? image;
  final bool status;
  final double price;
  final int quantity;
  final int? quantityMin;
  final int? quantityMax;
  final String? color;
  final Category? category;
  final DateTime createdAt;
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
  });

  Map<String, dynamic> toJson() {
    return {
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
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, barcode: $barcode, weight: $weight, dimension: $dimension, expirationDate: ${expirationDate?.toIso8601String()}, location: $location, manufacturer: $manufacturer, supplier: $supplier, icon: $icon, image: $image, status: $status, price: $price, quantity: $quantity, quantityMin: $quantityMin, quantityMax: $quantityMax, color: $color, category: $category, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
