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

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        parentId: json['parent']?.toString(),
        name: json['name'],
        icon: json['icon'],
        description: json['description'],
        status: json['status'],
        color: json['color'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'parent': parentId,
        'name': name,
        'icon': icon,
        'description': description,
        'status': status,
        'color': color,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  Map<String, dynamic> toJsonForSQL() => {
        'id': id,
        'parent_id': parentId,
        'name': name,
        'icon': icon,
        'description': description,
        'status': status ? 1 : 0,
        'color': color,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  @override
  String toString() {
    return 'Category{id: $id, parentId: $parentId, name: $name, icon: $icon, description: $description, status: $status, color: $color, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
