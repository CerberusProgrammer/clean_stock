import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Supplier extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? icon;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final String? address;

  @HiveField(5)
  final String? website;

  @HiveField(6)
  final String? contactEmail;

  @HiveField(7)
  final String? contactPhone;

  @HiveField(8)
  final String? country;

  @HiveField(9)
  final String? city;

  @HiveField(10)
  final bool status;

  @HiveField(11)
  final String? color;

  @HiveField(12)
  final DateTime createdAt;

  @HiveField(13)
  final DateTime updatedAt;

  Supplier({
    this.id,
    required this.name,
    this.icon,
    this.description,
    this.address,
    this.website,
    this.contactEmail,
    this.contactPhone,
    this.country,
    this.city,
    required this.status,
    this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      description: json['description'],
      address: json['address'],
      website: json['website'],
      contactEmail: json['contactEmail'],
      contactPhone: json['contactPhone'],
      country: json['country'],
      city: json['city'],
      status: json['status'],
      color: json['color'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'description': description,
      'address': address,
      'website': website,
      'contactEmail': contactEmail,
      'contactPhone': contactPhone,
      'country': country,
      'city': city,
      'status': status,
      'color': color,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Supplier(id: $id, name: $name, icon: $icon, description: $description, address: $address, website: $website, contactEmail: $contactEmail, contactPhone: $contactPhone, country: $country, city: $city, status: $status, color: $color, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
