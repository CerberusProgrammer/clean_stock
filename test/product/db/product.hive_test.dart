import 'package:flutter_test/flutter_test.dart';
import 'package:clean_stock/products/db/product.model.hive.dart';
import 'package:clean_stock/products/db/product.hive.dart';
import 'package:hive/hive.dart';

void main() {
  group('ProductHive', () {
    late Box<Product> productsBox;

    setUp(() {
      productsBox = Hive.box<Product>('products');
    });

    tearDown(() async {
      await productsBox.clear();
      await Hive.close();
    });

    test('getProductsBox should return the products box', () {
      final box = ProductHive.getProductsBox();

      expect(box, equals(productsBox));
    });

    test(
        'getProducts should return a list of products matching the given criteria',
        () async {
      final product1 = Product(
        name: 'Product 1',
        description: 'Description 1',
        barcode: '123456789',
        weight: 1.5,
        dimension: '10x10x10',
        expirationDate: DateTime(2022, 12, 31),
        location: 'Shelf A',
        id: 0,
        status: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        price: 10,
        quantity: 10,
      );
      final product2 = Product(
        name: 'Product 2',
        description: 'Description 2',
        barcode: '987654321',
        weight: 2.0,
        dimension: '20x20x20',
        expirationDate: DateTime(2023, 12, 31),
        location: 'Shelf B',
        id: 1,
        status: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        price: 10,
        quantity: 10,
      );
      final product3 = Product(
        name: 'Product 3',
        description: 'Description 3',
        barcode: '543216789',
        weight: 1.0,
        dimension: '5x5x5',
        expirationDate: DateTime(2022, 6, 30),
        location: 'Shelf C',
        id: 2,
        status: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        price: 10,
        quantity: 10,
      );

      await productsBox.add(product1);
      await productsBox.add(product2);
      await productsBox.add(product3);

      final products = await ProductHive.getProducts(
        name: 'Product 1',
        weight: 1.5,
        location: 'Shelf A',
      );

      expect(products.length, equals(1));
      expect(products[0], equals(product1));
    });
  });
}
