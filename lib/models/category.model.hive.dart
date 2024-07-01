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

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      parentId: json['parentId'],
      name: json['name'],
      icon: json['icon'],
      description: json['description'],
      status: json['status'],
      color: json['color'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parentId': parentId,
      'name': name,
      'icon': icon,
      'description': description,
      'status': status,
      'color': color,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Category(id: $id, parentId: $parentId, name: $name, icon: $icon, description: $description, status: $status, color: $color, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
