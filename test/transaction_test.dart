import 'package:clean_stock/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Transaction toJson() should return a valid JSON map', () {
    final transaction = Transaction(
      id: '1',
      productId: 'sample_product',
      quantity: 10,
      price: 9.99,
      createdAt: DateTime(2022, 1, 1),
      updatedAt: DateTime(2022, 1, 7),
    );

    final json = transaction.toJson();

    expect(json['id'], equals('1'));
    expect(json['product'], equals('sample_product'));
    expect(json['quantity'], equals(10));
    expect(json['price'], equals(9.99));
    expect(json['created_at'], equals('2022-01-01T00:00:00.000'));
    expect(json['updated_at'], equals('2022-01-07T00:00:00.000'));
  });

  test('Transaction fromJson() should create a valid Transaction object', () {
    final json = {
      'id': '1',
      'product': 'sample_product',
      'quantity': 10,
      'price': 9.99,
      'created_at': '2022-01-01T00:00:00.000',
      'updated_at': '2022-01-07T00:00:00.000',
    };

    final transaction = Transaction.fromJson(json);

    expect(transaction.id, equals('1'));
    expect(transaction.productId, equals('sample_product'));
    expect(transaction.quantity, equals(10));
    expect(transaction.price, equals(9.99));
    expect(transaction.createdAt, equals(DateTime(2022, 1, 1)));
    expect(transaction.updatedAt, equals(DateTime(2022, 1, 7)));
  });

  test('Transaction toString() should return a formatted string', () {
    final transaction = Transaction(
      id: '1',
      productId: 'sample_product',
      quantity: 10,
      price: 9.99,
      createdAt: DateTime(2022, 1, 1),
      updatedAt: DateTime(2022, 1, 7),
    );

    final string = transaction.toString();

    expect(
      string,
      equals(
        'Transaction{id: 1, productId: sample_product, quantity: 10, price: 9.99, createdAt: 2022-01-01 00:00:00.000, updatedAt: 2022-01-07 00:00:00.000}',
      ),
    );
  });
}
