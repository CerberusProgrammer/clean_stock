import 'package:hive_flutter/hive_flutter.dart';

part 'manufacturer.g.dart';

@HiveType(typeId: 1)
class Manufacturer extends HiveObject {
  @HiveField(0)
  final int id;
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

  Manufacturer({
    required this.id,
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

  factory Manufacturer.fromJson(Map<String, dynamic> json) => Manufacturer(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        description: json['description'],
        address: json['address'],
        website: json['website'],
        contactEmail: json['contact_email'],
        contactPhone: json['contact_phone'],
        country: json['country'],
        city: json['city'],
        status: json['status'],
        color: json['color'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'description': description,
        'address': address,
        'website': website,
        'contact_email': contactEmail,
        'contact_phone': contactPhone,
        'country': country,
        'city': city,
        'status': status,
        'color': color,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  Map<String, dynamic> toJsonForSQL() => {
        'id': id,
        'name': name,
        'icon': icon,
        'description': description,
        'address': address,
        'website': website,
        'contact_email': contactEmail,
        'contact_phone': contactPhone,
        'country': country,
        'city': city,
        'status': status ? 1 : 0,
        'color': color,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  @override
  String toString() {
    return 'Manufacturer{id: $id, name: $name, icon: $icon, description: $description, address: $address, website: $website, contactEmail: $contactEmail, contactPhone: $contactPhone, country: $country, city: $city, status: $status, color: $color, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
