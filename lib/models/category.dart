class Category {
  final int id;
  final String? parentId;
  final String name;
  final String? icon;
  final String? description;
  final bool status;
  final String? color;
  final DateTime createdAt;
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
