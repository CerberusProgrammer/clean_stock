import 'package:clean_stock/models/category.model.hive.dart';
import 'package:clean_stock/models/manufacturer.model.hive.dart';
import 'package:clean_stock/models/supplier.model.hive.dart';
import 'package:clean_stock/products/db/product.model.hive.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Product toJson() should return a valid JSON map', () {
    final product = Product(
      id: 1,
      name: 'Sample Product',
      description: 'Sample description',
      barcode: '123456789',
      weight: 1.5,
      dimension: '10x10x10',
      expirationDate: DateTime(2022, 12, 31),
      location: 'Sample location',
      manufacturer: Manufacturer(
        id: 1,
        name: 'Sample Manufacturer',
        status: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      manufacturerId: 1,
      supplier: Supplier(
        id: 1,
        name: 'Sample Supplier',
        status: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      supplierId: 1,
      icon: 'sample_icon',
      image: 'sample_image',
      status: true,
      price: 9.99,
      quantity: 10,
      quantityMin: 1,
      quantityMax: 100,
      color: 'Sample color',
      category: Category(
        id: 1,
        name: 'Sample Category',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        status: false,
      ),
      categoryId: 1,
      createdAt: DateTime(2022, 1, 1),
      updatedAt: DateTime(2022, 1, 1),
    );

    final json = product.toJson();

    expect(json['id'], equals(1));
    expect(json['name'], equals('Sample Product'));
    expect(json['description'], equals('Sample description'));
    expect(json['barcode'], equals('123456789'));
    expect(json['weight'], equals(1.5));
    expect(json['dimension'], equals('10x10x10'));
    expect(json['expirationDate'], equals('2022-12-31T00:00:00.000'));
    expect(json['location'], equals('Sample location'));
    expect(json['manufacturerId'], equals(1));
    expect(json['supplierId'], equals(1));
    expect(json['icon'], equals('sample_icon'));
    expect(json['image'], equals('sample_image'));
    expect(json['status'], equals(true));
    expect(json['price'], equals(9.99));
    expect(json['quantity'], equals(10));
    expect(json['quantityMin'], equals(1));
    expect(json['quantityMax'], equals(100));
    expect(json['color'], equals('Sample color'));
    expect(json['categoryId'], equals(1));
    expect(json['createdAt'], equals('2022-01-01T00:00:00.000'));
    expect(json['updatedAt'], equals('2022-01-01T00:00:00.000'));
  });

  test('Product fromJson() should return a valid Product object', () {
    final json = {
      'id': 1,
      'name': 'Sample Product',
      'description': 'Sample description',
      'barcode': '123456789',
      'weight': 1.5,
      'dimension': '10x10x10',
      'expirationDate': '2022-12-31T00:00:00.000',
      'location': 'Sample location',
      'manufacturer': {
        'id': 1,
        'name': 'Sample Manufacturer',
        'status': false,
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      },
      'manufacturerId': 1,
      'supplier': {
        'id': 1,
        'name': 'Sample Supplier',
        'status': false,
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      },
      'supplierId': 1,
      'icon': 'sample_icon',
      'image': 'sample_image',
      'status': true,
      'price': 9.99,
      'quantity': 10,
      'quantityMin': 1,
      'quantityMax': 100,
      'color': 'Sample color',
      'category': {
        'id': 1,
        'name': 'Sample Category',
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
        'status': false,
      },
      'categoryId': 1,
      'createdAt': '2022-01-01T00:00:00.000',
      'updatedAt': '2022-01-01T00:00:00.000',
    };

    final product = Product.fromJson(json);

    expect(product.id, equals(1));
    expect(product.name, equals('Sample Product'));
    expect(product.description, equals('Sample description'));
    expect(product.barcode, equals('123456789'));
    expect(product.weight, equals(1.5));
    expect(product.dimension, equals('10x10x10'));
    expect(product.expirationDate, equals(DateTime(2022, 12, 31)));
    expect(product.location, equals('Sample location'));
    expect(product.manufacturer!.id, equals(1));
    expect(product.manufacturer!.name, equals('Sample Manufacturer'));
    expect(product.manufacturer!.status, equals(false));
    expect(product.manufacturer!.createdAt, isA<DateTime>());
    expect(product.manufacturer!.updatedAt, isA<DateTime>());
    expect(product.manufacturerId, equals(1));
    expect(product.supplier!.id, equals(1));
    expect(product.supplier!.name, equals('Sample Supplier'));
    expect(product.supplier!.status, equals(false));
    expect(product.supplier!.createdAt, isA<DateTime>());
    expect(product.supplier!.updatedAt, isA<DateTime>());
    expect(product.supplierId, equals(1));
    expect(product.icon, equals('sample_icon'));
    expect(product.image, equals('sample_image'));
    expect(product.status, equals(true));
    expect(product.price, equals(9.99));
    expect(product.quantity, equals(10));
    expect(product.quantityMin, equals(1));
    expect(product.quantityMax, equals(100));
    expect(product.color, equals('Sample color'));
    expect(product.category!.id, equals(1));
    expect(product.category!.name, equals('Sample Category'));
    expect(product.category!.createdAt, isA<DateTime>());
    expect(product.category!.updatedAt, isA<DateTime>());
    expect(product.category!.status, equals(false));
    expect(product.categoryId, equals(1));
    expect(product.createdAt, equals(DateTime(2022, 1, 1)));
    expect(product.updatedAt, equals(DateTime(2022, 1, 1)));
  });
}
