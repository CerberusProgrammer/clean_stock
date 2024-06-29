import 'package:clean_stock/models/Category.dart';
import 'package:clean_stock/models/manufacturer.dart';
import 'package:clean_stock/models/supplier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_stock/products/product.dart';
import 'package:clean_stock/products/product.query.dart';
import 'package:clean_stock/products/product.sql.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('ProductSQL Tests', () {
    test('Get all products without query parameters', () async {
      final List<Product> products =
          await ProductSQL.getProducts(queryParams: ProductQueryParams());

      expect(products.isNotEmpty, true);
    });

    test('Get products with query parameters', () async {
      final queryParams = ProductQueryParams(
        name: 'Test Product',
        description: 'This is a test product.',
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
      );

      final List<Product> products = await ProductSQL.getProducts(
        queryParams: queryParams,
      );

      expect(products.isNotEmpty, true);
    });

    test('Get product with Manufacturer query parameter', () async {
      final testProduct = Product(
        name: 'Test Product',
        description: 'This is a test product.',
        price: 9.99,
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
        expirationDate: DateTime.now(),
        manufacturer: Manufacturer(
          id: 1,
          name: 'Test Manufacturer',
          status: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        location: 'Aisle 4',
        status: true,
        quantity: 10,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: 0,
      );

      await ProductSQL.createProduct(product: testProduct);

      final queryParams = ProductQueryParams(manufacturer: 1);

      final List<Product> products = await ProductSQL.getProducts(
        queryParams: queryParams,
      );

      expect(products.isNotEmpty, true);
      expect(products.any((p) => p.manufacturerId == 1), true);
    });

    test('Get product with Category query parameter', () async {
      final testProduct = Product(
        name: 'Test Product',
        description: 'This is a test product.',
        price: 9.99,
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
        expirationDate: DateTime.now(),
        category: Category(
          id: 1,
          name: 'Test Category',
          status: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        location: 'Aisle 4',
        status: true,
        quantity: 10,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: 0,
      );

      await ProductSQL.createProduct(product: testProduct);

      final queryParams = ProductQueryParams(category: 1);

      final List<Product> products = await ProductSQL.getProducts(
        queryParams: queryParams,
      );

      expect(products.isNotEmpty, true);
      expect(products.any((p) => p.categoryId == 1), true);
    });

    test('Get product with Supplier query parameter', () async {
      final testProduct = Product(
        name: 'Test Product',
        description: 'This is a test product.',
        price: 9.99,
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
        expirationDate: DateTime.now(),
        supplier: Supplier(
          id: 1,
          name: 'Test Supplier',
          status: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        location: 'Aisle 4',
        status: true,
        quantity: 10,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: 0,
      );

      await ProductSQL.createProduct(product: testProduct);

      final queryParams = ProductQueryParams(supplier: 1);

      final List<Product> products = await ProductSQL.getProducts(
        queryParams: queryParams,
      );

      expect(products.isNotEmpty, true);
      expect(products.any((p) => p.supplierId == 1), true);
    });

    test(
        'Get product with Supplier, Category, and Manufacturer query parameters',
        () async {
      final testProduct = Product(
        name: 'Test Product',
        description: 'This is a test product.',
        price: 9.99,
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
        expirationDate: DateTime.now(),
        supplier: Supplier(
          id: 1,
          name: 'Test Supplier',
          status: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        category: Category(
          id: 1,
          name: 'Test Category',
          status: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        manufacturer: Manufacturer(
          id: 1,
          name: 'Test Manufacturer',
          status: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        location: 'Aisle 4',
        status: true,
        quantity: 10,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: 0,
      );

      await ProductSQL.createProduct(product: testProduct);

      final queryParams = ProductQueryParams(
        supplier: 1,
        category: 1,
        manufacturer: 1,
      );

      final List<Product> products = await ProductSQL.getProducts(
        queryParams: queryParams,
      );

      // expect(products.isNotEmpty, true);
      expect(products.any((p) => p.supplierId == 1), true);
      // expect(products.any((p) => p.categoryId == 1), true);
      expect(products.any((p) => p.manufacturerId == 1), true);
    });

    test('Create product', () async {
      final newProduct = Product(
        name: 'Test Product',
        description: 'This is a test product.',
        price: 9.99,
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
        expirationDate: DateTime.now(),
        location: 'Aisle 4',
        status: true,
        quantity: 10,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: 0,
      );

      final Product createdProduct = await ProductSQL.createProduct(
        product: newProduct,
      );

      expect(createdProduct.id, isNotNull);
    });

    test('Create product with Manufacturer object', () async {
      final newProduct = Product(
        name: 'Test Product',
        description: 'This is a test product.',
        price: 9.99,
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
        expirationDate: DateTime.now(),
        manufacturer: Manufacturer(
          id: 1,
          name: 'Test Manufacturer',
          status: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        location: 'Aisle 4',
        status: true,
        quantity: 10,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: 0,
      );

      final Product createdProduct = await ProductSQL.createProduct(
        product: newProduct,
      );

      expect(createdProduct.id, isNotNull);
    });

    test('Create product with Category object', () async {
      final newProduct = Product(
        name: 'Test Product',
        description: 'This is a test product.',
        price: 9.99,
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
        expirationDate: DateTime.now(),
        category: Category(
          id: 1,
          name: 'Test Category',
          status: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        location: 'Aisle 4',
        status: true,
        quantity: 10,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: 0,
      );

      final Product createdProduct = await ProductSQL.createProduct(
        product: newProduct,
      );

      expect(createdProduct.id, isNotNull);
    });

    test('Create product with Supplier object', () async {
      final newProduct = Product(
        name: 'Test Product',
        description: 'This is a test product.',
        price: 9.99,
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
        expirationDate: DateTime.now(),
        supplier: Supplier(
          id: 1,
          name: 'Test Manufacturer',
          status: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        location: 'Aisle 4',
        status: true,
        quantity: 10,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: 0,
      );

      final Product createdProduct = await ProductSQL.createProduct(
        product: newProduct,
      );

      expect(createdProduct.id, isNotNull);
    });

    test('product using Product object with only required parameters',
        () async {
      final newProduct = Product(
        id: 6,
        name: 'Test Product',
        description: 'This is a test product.',
        price: 9.99,
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
        expirationDate: DateTime.now(),
        location: 'Aisle 4',
        status: true,
        quantity: 10,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await ProductSQL.createProduct(product: newProduct);

      final List<Product> products =
          await ProductSQL.getProducts(queryParams: ProductQueryParams());

      expect(products.any((p) => p.name == newProduct.name), true);
    });

    test(' product using Product object with all optional parameters',
        () async {
      final newProduct = Product(
        id: 7,
        name: 'Test Product',
        description: 'This is a test product.',
        price: 9.99,
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
        expirationDate: DateTime.now(),
        location: 'Aisle 4',
        status: true,
        quantity: 10,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await ProductSQL.createProduct(product: newProduct);

      final List<Product> products = await ProductSQL.getProducts(
          queryParams: ProductQueryParams(
        name: newProduct.name,
        description: newProduct.description,
        barcode: newProduct.barcode,
        weight: newProduct.weight,
        dimension: newProduct.dimension,
        expirationDate: newProduct.expirationDate?.toIso8601String(),
        createdAt: newProduct.createdAt.toIso8601String(),
      ));

      expect(products.any((p) => p.name == newProduct.name), true);
    });

    test('Update product', () async {
      final existingProduct = Product(
        id: 1,
        name: 'Test Product',
        description: 'This is a test product.',
        price: 9.99,
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
        expirationDate: DateTime.now(),
        location: 'Aisle 4',
        status: true,
        quantity: 10,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final updatedProduct = await ProductSQL.updateProduct(
        product: existingProduct,
      );

      expect(updatedProduct, existingProduct);
    });

    test('Delete product', () async {
      final Product product = Product(
        id: 100,
        name: 'Test Product',
        description: 'This is a test product.',
        price: 9.99,
        barcode: 'asd',
        weight: 1.0,
        dimension: '10x20x30',
        expirationDate: DateTime.now(),
        location: 'Aisle 4',
        status: true,
        quantity: 10,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await ProductSQL.deleteProduct(
        product: product,
      );

      await ProductSQL.deleteProduct(product: product);

      final List<Product> products =
          await ProductSQL.getProducts(queryParams: ProductQueryParams());

      expect(products.any((p) => p.id == product.id), false);
    });
  });
}
