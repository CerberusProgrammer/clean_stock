import 'package:clean_stock/products/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Product toJson() should return a valid JSON map', () {
    final product = Product(
      id: 1,
      name: 'Sample Product',
      barcode: '123456789',
      status: true,
      price: 9.99,
      quantity: 10,
      createdAt: DateTime(2022, 1, 1),
      updatedAt: DateTime(2022, 1, 1),
    );

    final json = product.toJson();

    expect(json['id'], equals(1));
    expect(json['name'], equals('Sample Product'));
    expect(json['barcode'], equals('123456789'));
    expect(json['status'], equals(true));
    expect(json['price'], equals(9.99));
    expect(json['quantity'], equals(10));
    expect(json['created_at'], equals('2022-01-01T00:00:00.000'));
    expect(json['updated_at'], equals('2022-01-01T00:00:00.000'));
  });

  test('Product fromJson() should create a valid Product object', () {
    final json = {
      'id': 1,
      'name': 'Sample Product',
      'barcode': '123456789',
      'status': true,
      'price': 9.99,
      'quantity': 10,
      'created_at': '2022-01-01T00:00:00.000',
      'updated_at': '2022-01-01T00:00:00.000',
    };

    final product = Product.fromJson(json);

    expect(product.id, equals(1));
    expect(product.name, equals('Sample Product'));
    expect(product.barcode, equals('123456789'));
    expect(product.status, equals(true));
    expect(product.price, equals(9.99));
    expect(product.quantity, equals(10));
    expect(product.createdAt, equals(DateTime(2022, 1, 1)));
    expect(product.updatedAt, equals(DateTime(2022, 1, 1)));
  });
}
