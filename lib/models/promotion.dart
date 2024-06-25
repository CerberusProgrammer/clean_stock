class Promotion {
  final String userId;
  final String name;
  final String? description;
  final double discountPercentage;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> productIds;
  final List<String> categoryIds;
  final DateTime createdAt;
  final bool status;

  Promotion({
    required this.userId,
    required this.name,
    this.description,
    required this.discountPercentage,
    required this.startDate,
    required this.endDate,
    this.productIds = const [],
    this.categoryIds = const [],
    required this.createdAt,
    this.status = true,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        userId: json['user'],
        name: json['name'],
        description: json['description'],
        discountPercentage: json['discount_percentage'],
        startDate: DateTime.parse(json['start_date']),
        endDate: DateTime.parse(json['end_date']),
        productIds: List<String>.from(json['products']),
        categoryIds: List<String>.from(json['categories']),
        createdAt: DateTime.parse(json['created_at']),
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'user': userId,
        'name': name,
        'description': description,
        'discount_percentage': discountPercentage,
        'start_date': startDate.toIso8601String(),
        'end_date': endDate.toIso8601String(),
        'products': productIds,
        'categories': categoryIds,
        'created_at': createdAt.toIso8601String(),
        'status': status,
      };

  bool isActive() {
    final now = DateTime.now();
    return startDate.isBefore(now) && endDate.isAfter(now);
  }

  @override
  String toString() {
    return 'Promotion{userId: $userId, name: $name, description: $description, discountPercentage: $discountPercentage, startDate: $startDate, endDate: $endDate, productIds: $productIds, categoryIds: $categoryIds, createdAt: $createdAt, status: $status}';
  }
}
