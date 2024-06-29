import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class Category extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? parentId;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String? icon;

  @HiveField(4)
  final String? description;

  @HiveField(5)
  final bool status;

  @HiveField(6)
  final String? color;

  @HiveField(7)
  final DateTime createdAt;

  @HiveField(8)
  final DateTime updatedAt;

  Category({
    required this.id,
    this.parentId,
    required this.name,
    this.icon,
    this.description,
    required this.status,
    this.color,
    required this.createdAt,
    required this.updatedAt,
  });
}
