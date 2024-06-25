import 'package:clean_stock/models/transaction.dart';

class Order {
  final String id;
  final bool status;
  final List<Transaction> transactions;
  final DateTime createdAt;
  final DateTime updatedAt;

  Order({
    required this.id,
    required this.status,
    required this.transactions,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['id'],
        status: json['status'],
        transactions: (json['transactions'] as List)
            .map((transaction) => Transaction.fromJson(transaction))
            .toList(),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'transactions':
            transactions.map((transaction) => transaction.toJson()).toList(),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  @override
  String toString() {
    return 'Order{id: $id, status: $status, transactions: $transactions, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
