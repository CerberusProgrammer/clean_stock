class Transaction {
  final String id;
  final String productId;
  final int quantity;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;

  Transaction({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'],
        productId: json['product'],
        quantity: json['quantity'],
        price: json['price'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': productId,
        'quantity': quantity,
        'price': price,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  @override
  String toString() {
    return 'Transaction{id: $id, productId: $productId, quantity: $quantity, price: $price, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
