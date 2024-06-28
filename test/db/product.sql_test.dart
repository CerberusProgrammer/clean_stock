import 'package:clean_stock/core/domain/db/data_sql.dart';
import 'package:clean_stock/models/Category.dart';
import 'package:clean_stock/models/manufacturer.dart';
import 'package:clean_stock/models/supplier.dart';
import 'package:clean_stock/products/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  group('Database Tests', () {
    test('Database creation', () async {
      final db = await initializeDB();
      expect(db, isNotNull);
    });

    test('Table existence', () async {
      final db = await initializeDB();
      const tableName = 'products';
      final tables = await db.rawQuery(
          "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
          [tableName]);
      expect(tables.isNotEmpty, true);
    });
  });

  test('Insert product using Product object with only required parameters',
      () async {
    final db = await initializeDB();

    var newProduct = Product(
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

    await db.insert(
      'products',
      newProduct.toJsonForSQL(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    final List<Map<String, dynamic>> products = await db.query('products');
    expect(products.length, isNonZero);
    expect(products.any((p) => p['name'] == newProduct.name), isTrue);

    await db.close();
  });

  test('Insert product using Product object with a Manufacturer object',
      () async {
    final db = await initializeDB();

    var newManufacturer = Manufacturer(
      id: 1,
      name: 'Test Manufacturer',
      icon: 'icon.png',
      description: 'This is a test manufacturer.',
      address: '123 Test St.',
      website: 'www.test.com',
      contactEmail: ' [email protected]',
      contactPhone: '123-456-7890',
      country: 'USA',
      city: 'Test City',
      status: true,
      color: 'blue',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await db.insert(
      'manufacturers',
      newManufacturer.toJsonForSQL(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    var newProduct = Product(
      id: 6,
      name: 'Test Product',
      description: 'This is a test product.',
      price: 9.99,
      barcode: 'asd',
      weight: 1.0,
      dimension: '10x20x30',
      expirationDate: DateTime.now(),
      location: 'Aisle 4',
      manufacturer: newManufacturer,
      status: true,
      quantity: 10,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await db.insert(
      'products',
      newProduct.toJsonForSQL(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    final List<Map<String, dynamic>> products = await db.query('products');
    expect(products.length, isNonZero);
    expect(products.any((p) => p['name'] == newProduct.name), isTrue);

    await db.close();
  });

  test('Insert product using Product object with a Supplier object', () async {
    final db = await initializeDB();

    var newSupplier = Supplier(
      id: 1,
      name: 'Test Supplier',
      address: '123 Test St.',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      status: true,
    );

    await db.insert(
      'suppliers',
      newSupplier.toJsonForSQL(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    var newProduct = Product(
      id: 7,
      name: 'Test Product',
      description: 'This is a test product.',
      price: 9.99,
      barcode: 'asd',
      weight: 1.0,
      dimension: '10x20x30',
      expirationDate: DateTime.now(),
      location: 'Aisle 4',
      supplier: newSupplier,
      status: true,
      quantity: 10,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await db.insert(
      'products',
      newProduct.toJsonForSQL(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    final List<Map<String, dynamic>> products = await db.query('products');
    expect(products.length, isNonZero);
    expect(products.any((p) => p['name'] == newProduct.name), isTrue);

    await db.close();
  });

  test('Insert product using Product object with a Category object', () async {
    final db = await initializeDB();

    var newCategory = Category(
      id: 1,
      name: 'Test Category',
      status: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await db.insert(
      'categories',
      newCategory.toJsonForSQL(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    var newProduct = Product(
      id: 8,
      name: 'Test Product',
      description: 'This is a test product.',
      price: 9.99,
      barcode: 'asd',
      weight: 1.0,
      dimension: '10x20x30',
      expirationDate: DateTime.now(),
      location: 'Aisle 4',
      category: newCategory,
      status: true,
      quantity: 10,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await db.insert(
      'products',
      newProduct.toJsonForSQL(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    final List<Map<String, dynamic>> products = await db.query('products');
    expect(products.length, isNonZero);
    expect(products.any((p) => p['name'] == newProduct.name), isTrue);

    await db.close();
  });

  test('Insert product using Product object with all optional parameters',
      () async {
    final db = await initializeDB();

    var newProduct = Product(
      id: 9,
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
      quantityMin: 1,
      quantityMax: 20,
      color: 'blue',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await db.insert(
      'products',
      newProduct.toJsonForSQL(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    final List<Map<String, dynamic>> products = await db.query('products');
    expect(products.length, isNonZero);
    expect(products.any((p) => p['name'] == newProduct.name), isTrue);

    await db.close();
  });

  test('Insert product with all optional parameters including objects',
      () async {
    final db = await initializeDB();

    var newManufacturer = Manufacturer(
      id: 2,
      name: 'Test Manufacturer',
      icon: 'icon.png',
      description: 'This is a test manufacturer.',
      address: '123 Test St.',
      website: 'www.test.com',
      contactEmail: ' [email protected]',
      contactPhone: '123-456-7890',
      country: 'USA',
      city: 'Test City',
      status: true,
      color: 'blue',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await db.insert(
      'manufacturers',
      newManufacturer.toJsonForSQL(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    var newSupplier = Supplier(
      id: 2,
      name: 'Test Supplier',
      address: '123 Test St.',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      status: true,
    );

    await db.insert(
      'suppliers',
      newSupplier.toJsonForSQL(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    var newCategory = Category(
      id: 2,
      name: 'Test Category',
      status: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await db.insert(
      'categories',
      newCategory.toJsonForSQL(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    var newProduct = Product(
      id: 10,
      name: 'Test Product',
      description: 'This is a test product.',
      price: 9.99,
      barcode: 'asd',
      weight: 1.0,
      dimension: '10x20x30',
      expirationDate: DateTime.now(),
      location: 'Aisle 4',
      manufacturer: newManufacturer,
      supplier: newSupplier,
      category: newCategory,
      status: true,
      quantity: 10,
      quantityMin: 1,
      quantityMax: 20,
      color: 'blue',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await db.insert(
      'products',
      newProduct.toJsonForSQL(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    final List<Map<String, dynamic>> products = await db.query('products');
    expect(products.length, isNonZero);
    expect(products.any((p) => p['name'] == newProduct.name), isTrue);

    await db.close();
  });
}
