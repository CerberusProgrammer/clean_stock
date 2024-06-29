import 'package:hive/hive.dart';

@HiveType(typeId: 0)
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
}
